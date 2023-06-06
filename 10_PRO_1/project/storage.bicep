resource storage_test 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'storagetest'
  sku: {
    name: 'Standard_LRS'
  }
  kind:'StorageV2'
  location: 'CentralUS'
  
}
