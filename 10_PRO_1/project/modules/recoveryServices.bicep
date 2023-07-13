@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

// @description('The name for the Managed Identity.')
// param managedIdName string

@description('The name of the Management Server.')
param mgmtServerName string

@description('The name of the Recovery Services Vault')
param recoveryVaultName string = '${take(envName, 3)}-${take(location, 6)}-recoveryvault${take(uniqueString(resourceGroup().id), 6)}'

// var mgmtBackupPolicy = '${mgmtServerName}-BackupPolicy'

// resource managedId 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
//   name: managedIdName
// }

resource mgmtServer 'Microsoft.Compute/virtualMachines@2023-03-01' existing = {
  name: mgmtServerName
}

resource recoveryVault 'Microsoft.RecoveryServices/vaults@2023-01-01' = {
  name: recoveryVaultName
  location: location
  identity: {
    type: 'SystemAssigned'
    // userAssignedIdentities: {
    //   '${managedId.id}': {}
    // }
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
  dependsOn: [
    // managedId
    mgmtServer
  ]
}

//recovery policy for the management server
// resource mgmtRecoveryPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-01-01' = {
//   name: mgmtBackupPolicy
//   parent: recoveryVault
//   properties: {
//     protectedItemsCount: 1
//     backupManagementType: 'AzureIaasVM'
//     instantRpRetentionRangeInDays: 2
//     policyType: 'V2'
//     retentionPolicy: {
//       retentionPolicyType: 'SimpleRetentionPolicy'
//       retentionDuration: {
//         count: 1
//         durationType: 'Weeks'
//       }
//     }
//     schedulePolicy: {
//       scheduleRunFrequency: 'Daily'
//       schedulePolicyType: 'SimpleSchedulePolicyV2'
//       dailySchedule: {
//         scheduleRunTimes: [
//           '2017-01-26T05:30:00Z'
//         ]
//       }
//     }
//   }
// }

var backupFabric = 'Azure'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${mgmtServerName}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${mgmtServerName}'

resource mgmtBackup 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2023-02-01' = {
  name: '${recoveryVaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
  location: location
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: '${recoveryVault.id}/backupPolicies/DefaultPolicy'
    // policyId: resourceId('Microsoft.RecoveryServices/vaults/backupPolicies', recoveryVaultName, mgmtBackupPolicy)
    sourceResourceId: mgmtServer.id
  }
  dependsOn: [
    mgmtServer
  ]
}


