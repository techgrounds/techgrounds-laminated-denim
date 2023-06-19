@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string = 'dev'
//load balancer, vmss, public ip. Linked to outputs from networking.bicep


@description('The Azure Region into which the resources are deployed.')
param location string = resourceGroup().location

@description('The name of the webserver VM scaleset.')
param webServerName string = 'webserver'

// A virtual machine scale set with all its required dependencies.

//A network interface coupled to vnet1 and subnet1 from networking.bicep
