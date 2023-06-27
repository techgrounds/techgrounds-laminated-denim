@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

@secure()
@description('The admin username.')
param adminUserName string

@secure()
@description('The admin password.')
param adminPassword string

//Variable for keyvault name.
var keyVaultName = '${take(envName, 3)}-${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
var adminUserSecretName = '${keyVaultName}-adminUserName'
var adminPasswordSecretName = '${keyVaultName}-adminPassword'
var diskEncryptionSetName = '${keyVaultName}-diskEncryptionSet'
var diskEncryptionKeyName = '${keyVaultName}-diskEncryptionKey'

// Deploys a Key Vault.
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
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
    publicNetworkAccess: 'disabled'
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 7
    tenantId: tenant().tenantId
  }
}

resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-02-01' = {
  name: 
  parent: 
  properties: {
    accessPolicies: [
      {
        applicationId:
        objectId:
        permissions: {
          certificates: [
            'string'
          ]
          keys: [
            'string'
          ]
          secrets: [
            'string'
          ]
          storage: [
            'string'
          ]
        }
        tenantId: 'string'
      }
    ]
  }
}

resource diskEncryptionKey 'Microsoft.KeyVault/vaults/keys@2023-02-01'= {
  parent: keyVault
  name: diskEncryptionKeyName
  properties: {
    attributes: {
      enabled: true
    }
    keySize: 4096
    kty: 'RSA'
    keyOps: [
      'encrypt'
      'decrypt'
      'import'
      'release'
      'unwrapKey'
      'wrapKey'
    ]
  }
}

resource diskEncryptionSet 'Microsoft.Compute/diskEncryptionSets@2022-07-02' = {
  name: diskEncryptionSetName
  location: location
  tags: {
    location: location
    environment: envName
  }
  identity: {
    type: 'systemAssigned'
  }
  properties: {
    activeKey: {
      keyUrl: diskEncryptionKey.properties.keyUriWithVersion
      sourceVault: {
        id: keyVault.id
      }
    }
    rotationToLatestKeyVersionEnabled: true
  }
}

resource adminUserSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: adminUserSecretName
  properties: {
    value: adminUserName
  }
}

resource adminPasswordSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: adminPasswordSecretName
  properties: {
    value: adminPassword
  }
}

// resource kvRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
//   name: guid(roleIdMapping[roleName],objectId,kv.id)
//   scope: kv
//   properties: {
//     roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleIdMapping[roleName])
//     principalId: objectId
//     principalType: 'ServicePrincipal'
//   }
// }

output adminUserNameSecret string = adminUserSecret.properties.secretUriWithVersion
#disable-next-line outputs-should-not-contain-secrets // This outputs the secret URI, not the secret.
output adminPasswordSecret string = adminPasswordSecret.properties.secretUriWithVersion

output keyVaultID string = keyVault.name
output diskEncryptionSetName string = diskEncryptionSet.name
