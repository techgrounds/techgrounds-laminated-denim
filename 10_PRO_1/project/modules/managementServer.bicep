@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

// Variable for the management server VM name.
var mgmtServerName = take('${take(envName, 3)}${take(location, 6)}mgmtserv${uniqueString(resourceGroup().id)}', 24)
var mgmtServerSku = envName == 'dev' ? 'Standard_B1s' : 'Standard_B2s'

// a VM management server running Ubuntu
resource mgmtServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: mgmtServerName
  location: location
}

// a NIC attached to the VM management server
resource mgmtServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: '${mgmtServerName}nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnet.id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}
