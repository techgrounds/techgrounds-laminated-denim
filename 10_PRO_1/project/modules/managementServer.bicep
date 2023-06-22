@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

@secure()
@description('The administrator username.')
param adminUsername string

@secure()
@description('The administrator password.')
param adminPassword string

// Parameters with outputs from other modules.
//param keyVaultIdentity string
param VNet2Identity string
param vnet2Subnet1Identity string
//param nsg2Identity string
//param StorageAcc string
param StorageAccBlobEndpoint string

//Variables for the networking components of the VM.
var MgmtDNSLabel = toLower('${mgmtServerName}${take(uniqueString(resourceGroup().id), 4)}')
var publicIpSku = 'Standard'
var nicName = 'MgmtServerNic'

// Variable for the management server VM.
var mgmtServerName = '${take(envName, 3)}${take(location, 6)}mgmtsv'
var mgmtServerSize = envName == 'dev' ? 'Standard_B1ms' : 'Standard_B2s'
// variable for the Windows Server OS version
var MgmtServerOSVersion = '2022-Datacenter'

// A public IP for the management server.
resource mgmtServerPIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: '${mgmtServerName}-pip'
  location: location
  sku: {
    name: publicIpSku
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: MgmtDNSLabel
    }
  }
}

resource MgmtServerNIC 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'MgmtServerIPConfig'
        properties: {
          privateIPAddress: '10.10.20.10'
          privateIPAddressVersion: 'IPv4'
          privateIPAllocationMethod: 'Static'
          publicIPAddress: {
            id: mgmtServerPIP.id
          }
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', VNet2Identity, vnet2Subnet1Identity)
          }
        }
      }
    ]
  }
  dependsOn: [
  ]
}

// a VM management server running Windows Server.
resource mgmtServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: mgmtServerName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: mgmtServerSize
    }
    osProfile: {
      computerName: mgmtServerName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: MgmtServerOSVersion
        version: 'latest'
      }
    osDisk: {
      createOption: 'FromImage'
      managedDisk: {
        storageAccountType: 'StandardSSD_LRS'
      }
    }
    dataDisks: [
      {
        diskSizeGB: 256
        lun: 0
        createOption: 'Empty'
      }
    ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: MgmtServerNIC.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: StorageAccBlobEndpoint
      }
    }
  }
}
