@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

@description('The name for the Managed Identity.')
param managedIdName string

@description('The name of the Management Server.')
param mgmtServerName string

@description('The name of the Recovery Services Vault')
param recoveryVaultName string = '${take(envName, 3)}-${take(location, 6)}-recoveryvault${take(uniqueString(resourceGroup().id), 6)}'

resource managedId 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
  name: managedIdName
}

resource mgmtServer 'Microsoft.Compute/virtualMachines@2023-03-01' existing = {
  name: mgmtServerName
}

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2023-01-01' = {
  name: recoveryVaultName
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedId.id}': {}
    }
  }
  tags: {
    Location: location
    Environment: envName
  }
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    monitoringSettings: {
      azureMonitorAlertSettings: {
        alertsForAllJobFailures: 'Enabled'   
      }
      classicAlertSettings: {
        alertsForCriticalOperations: 'Enabled'
      }
    }
    publicNetworkAccess: 'Disabled'
  }
}


var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${mgmtServerName}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${mgmtServerName}'

//recovery container for the management server
resource mgmtRecoveryContainer 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers@2023-02-01' = {
  name: '${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    containerType:'Microsoft.Compute/virtualMachines'
    virtualMachineId: mgmtServer.id
  }
}

//recovery policy for the management server
// resource mgmtRecoveryPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-01-01' = {
//   name: '${mgmtServerName}-BackupPolicy'
//   properties: {
//     protectedItemsCount: 1
//     backupManagementType: 'AzureIaasVM'
//     retentionPolicy: {
//       retentionPolicyType: 'SimpleRetentionPolicy'
//       retentionDuration: {
//         count: 1
//         durationType: 'Weeks'
//       }
//     }
//   }
// }

// resource recoveryVaultPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-01-01' = {
//   name: VaultPolicyName
//   location: location
//   tags: {
//     Location: location
//     Environment: envName
//   }
//   parent: recoveryVault
//   properties: {
//     protectedItemsCount: 1
//     backupManagementType: 'AzureSql'
//     retentionPolicy: {
//       retentionPolicyType: 'SimpleRetentionPolicy'
//       retentionDuration: {
//         count: 1
//         durationType: 'Weeks'
//       }
//     }
//   }
// }

