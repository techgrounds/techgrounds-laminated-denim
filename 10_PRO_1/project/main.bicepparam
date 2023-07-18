using './main.bicep'

param envName = 'dev'
param location = resourceGroup().location
param adminUsername = ''
param adminPassword = ''
param sslPassword = ''
param allowedIpRange = [
  '31.151.222.110'
  '31.151.222.111'
]
param principalId = ''
param managedIdName = 'keyVaultManagedIdentity'
param mgmtServerName = '${take(envName, 3)}${take(location, 6)}mgmtsv'

