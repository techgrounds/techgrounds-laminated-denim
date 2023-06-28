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

@description('The object ID of the service principal that will be granted access to the Key Vault.')
param principalId string

//Variable for keyvault name.
var keyVaultName = '${take(envName, 3)}-${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
var adminUserSecretName = '${keyVaultName}-adminUserName'
var adminPasswordSecretName = '${keyVaultName}-adminPassword'
var diskEncryptionSetName = '${keyVaultName}-diskEncryptionSet'
var diskEncryptionKeyName = 'diskEncryptionSetKey'

// Deploys a Key Vault.
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
    accessPolicies: [
      {
        objectId: principalId
        permissions: {
          certificates: [
            'all'
          ]
          keys: [
            'all'
          ]
          secrets: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
        tenantId: tenant().tenantId
      }
      // an access policy allowing the disk encryption set to access the key vault 
      {
        objectId: diskEncryptionSet.identity.principalId
        permissions: {
          keys: [
            'get'
            'wrapKey'
            'unwrapKey'
          ]
        }
        tenantId: tenant().tenantId
      }
    ]
    createMode: 'default'
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enableRbacAuthorization: false
    enableSoftDelete: false
    networkAcls: {
      bypass: 'AzureServices'
      ipRules: [
        {
          value: '31.151.222.110'
        }
      ]
      defaultAction: 'Deny'
    }
    publicNetworkAccess: 'enabled'
    sku: {
      family: 'A'
      name: 'standard'
    }
    softDeleteRetentionInDays: 7
    tenantId: tenant().tenantId
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
    }
    rotationToLatestKeyVersionEnabled: true
  }
  dependsOn: keyVault
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

// resource diskEncryptionAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-02-01' = {
//   name: 'add'
//   parent: keyVault
//   properties: {
//     accessPolicies: [
//       {
//         objectId: diskEncryptionSet.identity.principalId
//         permissions: {
//           keys: [
//             'get'
//             'wrapKey'
//             'unwrapKey'
//           ]
//         }
//         tenantId: subscription().tenantId
//       }
//     ]
//   }
// }

//resource recoverySecret 'Microsoft.KeyVault/vaults/keys@2023-02-01'

output adminUserNameSecret string = adminUserSecret.properties.secretUriWithVersion
#disable-next-line outputs-should-not-contain-secrets // This outputs the secret URI, not the secret.
output adminPasswordSecret string = adminPasswordSecret.properties.secretUriWithVersion

output keyVaultID string = keyVault.name
// output diskEncryptionSetName string = diskEncryptionSet.name
