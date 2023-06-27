@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

@description('The name of the Web Server.')
param webServerName string

@description('The name of the Recovery Services Vault')
param recoveryVaultName string

var VaultPolicyName = '${recoveryVaultName}-policy'
var VaultVmssContainerName = '${recoveryVaultName}-websv-container'

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
        keyUri: 'string'
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
    backupManagementType: 'AzureIaasVM'
instantRPDetails: {
  azureBackupRGNamePrefix: 'string'
  azureBackupRGNameSuffix: 'string'
}
instantRpRetentionRangeInDays: int
policyType: 'string'
retentionPolicyType: 'SimpleRetentionPolicy'
retentionDuration: {
  count: int
  durationType: 'string'
}
schedulePolicy: {
  schedulePolicyType: 'SimpleSchedulePolicyV2'
  dailySchedule: {
    scheduleRunTimes: [
      'string'
    ]
  }
  hourlySchedule: {
    interval: int
    scheduleWindowDuration: int
    scheduleWindowStartTime: 'string'
  }
  scheduleRunFrequency: 'string'
  weeklySchedule: {
    scheduleRunDays: [
      'string'
    ]
    scheduleRunTimes: [
      'string'
    ]
  }
}
tieringPolicy: {}
timeZone: 'string'
  }
}

resource recoveryVaultVmssContainer 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2023-02-01' = {
  name: VaultVmssContainerName
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachineScaleSets'
    policyId: '${recoveryVault.id}/backupPolicies/${recoveryVaultPolicy.id}'
    sourceResourceId: webServerName
  }
} 
