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
param diskEncryptionSetName string
param VNet2Identity string
param vnet2Subnet1Identity string
//param StorageAcc string
param StorageAccBlobEndpoint string

@description('The name of the management server.')
param mgmtServerName string

//Variables for the networking components of the VM.
var MgmtDNSLabel = toLower('${mgmtServerName}${take(uniqueString(resourceGroup().id), 4)}')
var publicIpSku = 'Standard'
var nicName = 'MgmtServerNic'

// Variable for the management server VM.
var mgmtServerSize = envName == 'dev' ? 'Standard_B1ms' : 'Standard_B2s'
// variable for the Windows Server OS version
var MgmtServerOSVersion = '2022-Datacenter'

resource diskEncryptionSet 'Microsoft.Compute/diskEncryptionSets@2022-07-02' existing = {
  name: diskEncryptionSetName
}

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
  identity: {
    type: 'SystemAssigned'
  }
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
        diskEncryptionSet: {
          id: diskEncryptionSet.id
        }
      }
    }
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
