@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

//Variables for VNet1 and subnet1
var vnet1Name = '${envName}-${take(location, 6)}-vnet1'
var vnet1AddressPrefix = '10.10.10.0/24'

//Variables for VNet2 and subnet2
var vnet2Name = '${envName}-${take(location, 6)}-vnet2'
var vnet2AddressPrefix = '10.10.20.0/24'

// Two Virtual Networks. The first with a subnet range of 10.10.10.0/24 and the second with a subnet range of 10.20.20.0/24.
resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet1AddressPrefix
      ]
    }
  }
}

//Virtual Network peering between VNet1 and VNet2.
resource vnet1vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-11-01' = {
  parent: vnet1
  name: '${vnet1Name}-${vnet2Name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet2.id
    }
  }
}

resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet2Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet2AddressPrefix
      ]
    }
  }
}

// A network security group that allows HTTPS traffic from the internet and SSH access from the management server on vnet2.
resource nsg1 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: '${vnet1Name}-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'https'
        properties: { //fix when webserver is up!!!!!!!!!!!!!!
          protocol: 'TCP'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '443'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
        {
        name: 'ssh'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: '' //fill this in when the management server is up!!!!!!!!!!!!!!!!!!!!!
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
    ]
  }
}

// NSG for vnet2. Allows access to the management server via public IP from trusted locations.
resource nsg2 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
name: '${vnet2Name}-nsg'
location: location
properties: {
  securityRules: [
    {
      name: 'ssh'
      properties: {
        protocol: 'TCP'
        sourceAddressPrefix: '' //fill this in when the management server is up!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        destinationAddressPrefix: '*'
        sourcePortRange: '*'
        destinationPortRange: '22'
        access: 'Allow'
        priority: 100
        direction: 'Inbound'
          }
        }
      ]
    }
  }
