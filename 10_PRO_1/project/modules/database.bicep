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
//

@description('Server Name for Azure database for MySQL')
param sqlServerName string = '${take(envName, 3)}${take(location, 6)}mysqlserv${take(uniqueString(resourceGroup().id), 4)}'

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

var firewallrules = [
  {
    Name: 'rule1'
    StartIpAddress: '10.10.10.0'
    EndIpAddress: '10.10.10.255'
  }
  {
    Name: 'rule2'
    StartIpAddress: '10.10.20.0'
    EndIpAddress: '10.10.20.255'
  }
]

var databasePrivateEndpointName = '${sqlServerName}-EndPoint'
var privateDnsZoneName = 'privatelink${environment().suffixes.sqlServerHostname}'
var pvtEndpointDnsGroupName = '${databasePrivateEndpointName}/mydnsgroupname'

resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01'existing = {
  name: Vnet1Identity
}

resource mySqlServer 'Microsoft.DBforMySQL/servers@2017-12-01' = {
  name: sqlServerName
  location: location
  sku: {
    name: skuName
    tier: SkuTier
    capacity: skuCapacity
    size: '${SkuSizeMB}'  //a string is expected here but a int for the storageProfile...
    family: skuFamily
  }
  properties: {
    createMode: 'Default'
    version: mysqlVersion
    administratorLogin: adminUsername
    administratorLoginPassword: adminPassword
    publicNetworkAccess: 'Disabled'
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

@batchSize(1)
resource firewallRules 'Microsoft.DBforMySQL/servers/firewallRules@2017-12-01' = [for rule in firewallrules: {
  parent: mySqlServer
  name: '${rule.Name}'
  properties: {
    startIpAddress: rule.StartIpAddress
    endIpAddress: rule.EndIpAddress
  }
}]

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
