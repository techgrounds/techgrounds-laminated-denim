@description('The environment name. "dev" and "prod" are valid inputs.')
@allowed([
  'dev'
  'prod'
])
param envName string

@description('The Azure Region into which the resources are deployed.')
param location string

//A parameter array with the IP ranges that are allowed to access the management server via SSH and RDP.
@description('The IP ranges that are allowed to access the management server via SSH and RDP.')
param allowedIpRange array

//Variables for VNet1 and its subnets.
var vnet1Name = '${envName}-${take(location, 6)}-vnet1'
var vnet1AddressPrefix = '10.10.10.0/24'
var vnet1Subnet1AddressPrefix = '10.10.10.0/25'
var vnet1Subnet2AddressPrefix = '10.10.10.128/25'

//Variables for VNet2 and its subnets.
var vnet2Name = '${envName}-${take(location, 6)}-vnet2'
var vnet2AddressPrefix = '10.10.20.0/24'

// Two Virtual Networks. Vnet1 contains two subnets, hosting the webserver VMSS and App Gateway.
// Vnet 2 hosts the management server, database and any eventual desktop instances.
resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet1Name
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet1AddressPrefix
      ]
    }
    subnets: [
      {
        name: '${vnet1Name}-subnet1' //subnet for webserver VMSS.
        properties: {
          addressPrefix: vnet1Subnet1AddressPrefix
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          networkSecurityGroup: {
            id: Vnet1Nsg1.id
          }
        }
      }
      {
        name: '${vnet1Name}-subnet2' //subnet for App Gateway.
        properties: {
          addressPrefix: vnet1Subnet2AddressPrefix
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          networkSecurityGroup: {
            id: Vnet1Nsg2.id
          }
        }
      }
    ]
  }
}

resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet2Name
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet2AddressPrefix
      ]
    }
    subnets: [
      {
        name: '${vnet2Name}-subnet1'
        properties: {
          addressPrefix: vnet2AddressPrefix
          networkSecurityGroup: {
            id: Vnet2Nsg1.id
          }
        }
      }
    ]
  }
}

//Virtual Network peering between VNet1 and VNet2.
resource vnet1vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-11-01' = {
  parent: vnet1
  name: '${vnet1Name}-to-${vnet2Name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: true
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet2.id
    }
  }
}

resource vnet2vnet1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-07-01' = {
  name: '${vnet2Name}-to-${vnet1Name}'
  parent: vnet2
  properties: {    
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: true   
    doNotVerifyRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet1.id
    }
  }
}

// A network security group for vnet1 that allows HTTPS and HTTP traffic from the internet and SSH access from the management server on vnet2.
resource Vnet1Nsg1 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: '${vnet1Name}-nsg1'
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
    securityRules: [
      {
        name: 'https'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: vnet1AddressPrefix
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '443'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
        }
      }
      {
        name: 'http'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: vnet1AddressPrefix
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '80'
          access: 'Allow'
          priority: 1050
          direction: 'Inbound'
        }
      }
        {
        name: 'ssh'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: '10.10.20.10/32' 
          sourcePortRange: '*' 
          destinationAddressPrefix: '*' 
          destinationPortRange: '22'
          access: 'Allow'
          priority: 1100
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource Vnet1Nsg2 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: '${vnet1Name}-nsg2'
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  properties: {
    securityRules: [
      {
        name: 'https'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '443'
          access: 'Allow'
          priority: 1000
          direction: 'Inbound'
        }
      }
      {
        name: 'http'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '80'
          access: 'Allow'
          priority: 1050
          direction: 'Inbound'
        }
      }
        {
        name: 'GatewayManager'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: 'GatewayManager'
          sourcePortRange: '*' 
          destinationAddressPrefix: '*' 
          destinationPortRange: '65200-65535'
          access: 'Allow'
          priority: 1100
          direction: 'Inbound'
        }
      }
    ]
  }
}

// NSG for vnet2. Allows access to the management server via public IP from trusted locations.
resource Vnet2Nsg1 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
name: '${vnet2Name}-nsg'
location: location
tags: {
  Environment: envName
  Location: location
}
properties: {
  securityRules: [
    {
      name: 'ssh'
      properties: {
        protocol: 'TCP'
        sourceAddressPrefix: '${allowedIpRange[0]}/32'
        destinationAddressPrefix: '*'
        sourcePortRange: '*'
        destinationPortRange: '22'
        access: 'Allow'
        priority: 1000
        direction: 'Inbound'
          }
        }
          {
          name: 'RDP'
          properties: {
            protocol: 'TCP'
            sourceAddressPrefix: '${allowedIpRange[0]}/32'
            destinationAddressPrefix: '*'
            sourcePortRange: '*'
            destinationPortRange: '3389'
            access: 'Allow'
            priority: 1100
            direction: 'Inbound'
              }
            }
      ]
    }
  }

  //Output all relevant info so that services in other modules can connect to the info in this module.
  output vnet1ID string = vnet1.name
  output vnet2ID string = vnet2.name
  output vnet1Subnet1ID string = vnet1.properties.subnets[0].name
  output vnet2Subnet1ID string = vnet2.properties.subnets[0].name
  output Vnet1Nsg1Name string = Vnet1Nsg1.name
  output Vnet2Nsg1Name string = Vnet2Nsg1.name
