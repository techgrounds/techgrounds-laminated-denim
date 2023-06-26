@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string = 'dev'

@description('The Azure Region into which the resources are deployed.')
param location string = resourceGroup().location

@secure()
@description('The administrator username.')
param adminUsername string

@secure()
@description('The administrator password.')
param adminPassword string

@description('The IP ranges that are allowed to access the management server via SSH and RDP.')
param allowedIpRange array = ['31.151.222.110', '31.151.222.111']

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
    allowedIpRange: allowedIpRange
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

module mgmtServer 'modules/managementServer.bicep' = {
  name: 'mgmtServer-${location}'
  params: {
    envName: envName
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    //StorageAcc: storage.outputs.storageAccountId
    StorageAccBlobEndpoint: storage.outputs.storageAccountBlobEndpoint
    //keyVaultIdentity: keyvault.outputs.keyVaultID
    VNet2Identity: networking.outputs.vnet2ID
    vnet2Subnet1Identity: networking.outputs.vnet2Subnet1ID
    //nsg2Identity: networking.outputs.nsg2ID
  }
}

module webServer 'modules/webserver.bicep' = {
  name: 'webServer-${location}'
  params: {
    envName: envName
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    Vnet1Identity: networking.outputs.vnet1ID
    vnet1Subnet1Identity: networking.outputs.vnet1Subnet1ID
    //StorageAccBlobEndpoint: storage.outputs.storageAccountBlobEndpoint
  }
}

module database 'modules/database.bicep' = {
  name: 'database-${location}'
  params: {
    envName: envName
    location: location
    adminUsername: adminUsername
    adminPassword: adminPassword
    Vnet1Identity: networking.outputs.vnet1ID
  }
}

// module recoveryVault 'modules/recoveryServices.bicep' = {
//   name: 'recoveryVault-${location}'
//   params: {
//     envName: envName
//     location: location
//     webServerName: webServer.outputs.webServerName
//   }
// }

