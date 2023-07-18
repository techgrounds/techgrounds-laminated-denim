//Resource group and tag parameters.
@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string = 'dev'

@description('The Azure Region into which the resources are deployed.')
param location string = resourceGroup().location
//

//Administrative and security parameters.
@secure()
@description('The administrator username.')
param adminUsername string

@secure()
@description('The administrator password.')
param adminPassword string

@secure()
@description('The password for the SSL certificate.')
param sslPassword string
//

//Networking parameters.
@description('The IP ranges that are allowed to access the management server via SSH and RDP.')
param allowedIpRange array = ['31.151.222.110', '31.151.222.111']
//

//Key Vault parameters.
@description('The object ID of the service principal that will be granted access to the Key Vault.')
param principalId string

@description('The name for the Managed Identity.')
param managedIdName string = 'keyVaultManagedIdentity'
//

//Mgmt Server parameters.
@description('The name of the management server.')
param mgmtServerName string = '${take(envName, 3)}${take(location, 6)}mgmtsv'
//

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
   adminPassword: adminPassword
   adminUserName: adminUsername
   principalId: principalId
   managedIdName: managedIdName
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
    StorageAccBlobEndpoint: storage.outputs.storageAccountBlobEndpoint
    diskEncryptionSetName: keyvault.outputs.diskEncryptionSetName
    VNet2Identity: networking.outputs.vnet2ID
    vnet2Subnet1Identity: networking.outputs.vnet2Subnet1ID
    mgmtServerName: mgmtServerName
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
    diskEncryptionSetName: keyvault.outputs.diskEncryptionSetName
    sslPassword: sslPassword
    // storageAccountName: storage.outputs.storageAccountName
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

module recoveryVault 'modules/recoveryServices.bicep' = {
  name: 'recoveryVault-${location}'
  params: {
    envName: envName
    location: location
    mgmtServerName: mgmtServerName
  }
}

