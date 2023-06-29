@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

@description('The name of the Key Vault.')
param keyVaultName string

@description('The name of the SQL Server.')
param sqlServerDbName string

@description('The name of the Recovery Services Vault')
param recoveryVaultName string = '${take(envName, 3)}-${take(location, 6)}-recoveryvault${take(uniqueString(resourceGroup().id), 6)}'

var VaultPolicyName = '${recoveryVaultName}-policy'
var VaultSqlContainerName = '${recoveryVaultName}-websv-container'
var recoveryVaultDbItemName = '${recoveryVaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
var backupFabric = 'Azure'
var protectionContainer = 'AzureSqlContainer;${resourceGroup().name};${sqlServerDbName}'
var protectedItem = 'AzureSQL; AzureSqlContainer;${resourceGroup().name};${sqlServerDbName}'

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: keyVaultName
}

resource mySqlServerDb 'Microsoft.DBforMySQL/servers/databases@2017-12-01' existing = {
  name: sqlServerDbName
}

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2023-01-01' = {
  name: recoveryVaultName
  location: location
  tags: {
    Location: location
    Environment: envName
  }
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    encryption: {
      infrastructureEncryption: 'Enabled'
      kekIdentity: {
        useSystemAssignedIdentity: true
      }
      keyVaultProperties: {
        keyUri: keyVault.properties.vaultUri
      }
    }
    monitoringSettings: {
      azureMonitorAlertSettings: {
        alertsForAllJobFailures: 'Enabled'
      }
    }
    publicNetworkAccess: 'Disabled'
  }
}

resource recoveryVaultPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-01-01' = {
  name: VaultPolicyName
  location: location
  tags: {
    Location: location
    Environment: envName
  }
  parent: recoveryVault
  properties: {
    protectedItemsCount: 1
    backupManagementType: 'AzureSql'
    retentionPolicy: {
      retentionPolicyType: 'SimpleRetentionPolicy'
      retentionDuration: {
        count: 1
        durationType: 'Weeks'
      }
    }
  }
}

// resource recoveryVaultContainer 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers@2023-02-01' = {
//   parent: recoveryVault.properties.b
//   name: VaultSqlContainerName
//   properties: {
//     containerType: 'AzureSqlContainer'
//     backupManagementType: 'AzureSql'
//   }
//   dependsOn: [
//     recoveryVault
//   ]
// }

resource recoveryVaultDbItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2023-02-01' = {
  name: recoveryVaultDbItemName
  properties: {
    protectedItemType: 'Microsoft.Sql/servers/databases'
    policyId: '${recoveryVault.id}/backupPolicies/${recoveryVaultPolicy.id}'
    sourceResourceId: mySqlServerDb.id
  }
} 
