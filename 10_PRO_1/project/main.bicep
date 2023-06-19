@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string = 'dev'

@description('The Azure Region into which the resources are deployed.')
param location string = resourceGroup().location

//param rgName string = ''
//= take('${take(envName, 3)}-${take(location, 6)}-rg${uniqueString(resourceGroup().id)}', 24)
//param rgLocation string = 'westeurope'

//module resourceGroupModule 'modules/resourceGroup.bicep' = {
  //name: 'resourceGroupModule'
  //scope: subscription()
  //params: {
    //rgName: rgName
    //location: location
  //}
//}

module networking 'modules/networking.bicep' = {
  name: 'networking-${location}'
  params: {
    envName: envName
    location: location
  }
}

module keyvault 'modules/keyvault.bicep' = {
 name: 'keyvault-${location}'
 params: {
   envName: envName
   location: location
 }
}

module storage 'modules/storageaccount.bicep' = {
  name: 'storage-${location}'
  params: {
    envName: envName
    location: location
  }
}
