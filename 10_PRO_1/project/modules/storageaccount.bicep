@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

@description('The Storage Account name.')
param storageAccName string = take('${take(envName, 3)}${take(location, 6)}stor${uniqueString(resourceGroup().id)}', 24)

@description('The Storage Account SKU.')
param storageAccSku string = envName == 'dev' ? 'Standard_LRS' : 'Standard_GZRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccName
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  sku: {
    name: storageAccSku
  }
  kind: 'StorageV2'
}

//output the storage account id
output storageAccountName string = storageAccount.name
output storageAccountBlobEndpoint string = storageAccount.properties.primaryEndpoints.blob
