@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

//Variable for keyvault name.
var keyVaultName = '${take(envName, 3)}-${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'

//Variable for tenantID
var tenantID = 'de60b253-74bd-4365-b598-b9e55a2b208d'

// Deploys a Key Vault.
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
    // accessPolicies: [
    //   {
    //     applicationId: null
    //     objectId: '3145ecd8-c8b0-4abf-a354-8e3ece6a998e'
    //     permissions: {
    //       certificates: [
    //         'all'
    //       ]
    //       keys: [
    //         'all'
    //       ]
    //       secrets: [
    //         'all'
    //       ]
    //       storage: [
    //         'all'
    //       ]
    //     }
    //     tenantId: tenantID
    //   }
    // ]
    createMode: 'default'
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
    enableSoftDelete: false
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'deny'
    }
    publicNetworkAccess: 'enabled'
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 30
    tenantId: tenantID
  }
}

output keyVaultID string = keyVault.name
