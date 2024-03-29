//Imported parameters
@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string = 'dev'

@description('The Azure Region into which the resources are deployed.')
param location string

@secure()
@description('The administrator username.')
param adminUsername string

@secure()
@description('The administrator password.')
param adminPassword string

param Vnet1Identity string

//SQL server parameters
@description('Server Name for Azure database for MySQL')
param mySqlServerName string = '${take(envName, 3)}${take(location, 6)}mysqlserv${take(uniqueString(resourceGroup().id), 4)}'

@description('Azure database for MySQL compute capacity in vCores (2,4,8,16,32)')
param skuCapacity int = 2

@description('Azure database for MySQL sku name ')
param skuName string = 'GP_Gen5_2'

@description('Azure database for MySQL Sku Size ')
param SkuSizeMB int = 5120

@description('Virtual Network RuleName')
param virtualNetworkRuleName string = 'AllowSubnet'

@description('Azure database for MySQL pricing tier')
@allowed([
  'Basic'
  'GeneralPurpose'
  'MemoryOptimized'
])
param SkuTier string = 'GeneralPurpose'

@description('Azure database for MySQL sku family')
param skuFamily string = 'Gen5'

@description('MySQL version')
@allowed([
  '5.6'
  '5.7'
  '8.0'
])
param mysqlVersion string = '8.0'

@description('MySQL Server backup retention days')
param backupRetentionDays int = 7

@description('Geo-Redundant Backup setting')
param geoRedundantBackup string = 'Disabled'

var databasePrivateEndpointName = '${mySqlServerName}-EndPoint'
var privateDnsZoneName = 'privatelink.mysql.database.azure.com'
var pvtEndpointDnsGroupName = '${databasePrivateEndpointName}/mydnsgroupname'

resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01'existing = {
  name: Vnet1Identity
}

//Creates an Azure Database for MySQL Single Server resource.
resource mySqlServer 'Microsoft.DBforMySQL/servers@2017-12-01' = {
  name: mySqlServerName
  location: location
  sku: {
    name: skuName
    tier: SkuTier
    capacity: skuCapacity
    size: '${SkuSizeMB}'
    family: skuFamily
  }
  properties: {
    sslEnforcement: 'Disabled'
    createMode: 'Default'
    version: mysqlVersion
    administratorLogin: adminUsername
    administratorLoginPassword: adminPassword
    publicNetworkAccess: 'Enabled'
    infrastructureEncryption: 'Enabled'
    storageProfile: {
      storageMB: SkuSizeMB
      backupRetentionDays: backupRetentionDays
      geoRedundantBackup: geoRedundantBackup
    }
  }

  resource virtualNetworkRule 'virtualNetworkRules@2017-12-01' = {
    name: virtualNetworkRuleName
    properties: {
      virtualNetworkSubnetId: vnet1.properties.subnets[0].id
      ignoreMissingVnetServiceEndpoint: true
    }
  }
}

// Creates a database on the MySQL server.
resource mySqlServerDB 'Microsoft.DBforMySQL/servers/databases@2017-12-01' = {
  parent: mySqlServer
  name: '${mySqlServerName}-myDB'
}

//The below resources create a private endpoint for the database server.
resource databasePrivateEndpoint 'Microsoft.Network/privateEndpoints@2022-11-01' = {
  name: databasePrivateEndpointName
  location: location
  properties: {
    subnet: {
      id: vnet1.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: databasePrivateEndpointName
        properties: {
          privateLinkServiceId: mySqlServer.id
          groupIds: [
            'mySqlServer'
          ]
        }
      }
    ]
  }
  dependsOn: [
    vnet1
  ]
}

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: privateDnsZoneName
  location: 'global'
  properties: {}
  dependsOn: [
    vnet1
  ]
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${privateDnsZoneName}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet1.id
    }
  }
}

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: pvtEndpointDnsGroupName
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDnsZone.id
        }
      }
    ]
  }
  dependsOn: [
    databasePrivateEndpoint
  ]
}
