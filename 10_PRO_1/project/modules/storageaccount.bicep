@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

//Sets the Storage Account Name as westeu-dev-stor<uniquestring>
var storageAccName = take('${take(envName, 3)}${take(location, 6)}stor${uniqueString(resourceGroup().id)}', 24)
//Sets the Storage Account SKU. Dev environment deploys the SA in LRS and prod deploys in GZRS mode.
var storageAccSku = envName == 'dev' ? 'Standard_LRS' : 'Standard_GZRS'

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
output storageAccountId string = storageAccount.id
output storageAccountBlobEndpoint string = storageAccount.properties.primaryEndpoints.blob
