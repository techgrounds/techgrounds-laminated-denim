param location string
param osDiskType string
param virtualNetworkId string
param virtualNetworkName string
param networkSecurityGroups array
param networkInterfaceConfigurations array
param backendPoolName string
param loadBalancerName string
param loadbalancingRuleFrontEndPort int
param loadbalancingRuleBackendEndPort int
param loadbalancingRuleProtocol string
param InboundNATRuleFrontEndPortRangeStart int
param vmName string
param virtualMachineScaleSetName string
param instanceCount string
param instanceSize string
param adminUsername string

@secure()
param adminPassword string

@secure()
param customData string
param autoScaleDefault string
param autoScaleMin string
param autoScaleMax string
param scaleOutCPUPercentageThreshold string
param durationTimeWindow string
param scaleOutInterval string
param scaleInCPUPercentageThreshold int
param scaleInInterval string
param predictiveAutoscaleMode string
param platformFaultDomainCount string

var storageApiVersion = '2021-01-01'
var networkApiVersion = '2020-11-01'
var virtualMachineScaleSetApiVersion = '2022-03-01'
var namingInfix = toLower(substring('${virtualMachineScaleSetName}${uniqueString(resourceGroup().id)}', 0, 9))
var vmssId = virtualMachineScaleSet.id
var autoScaleResourceName = '${virtualMachineScaleSetName}autoscale'

resource networkSecurityGroups_name 'Microsoft.Network/networkSecurityGroups@2019-02-01' = [for item in networkSecurityGroups: {
  name: item.name
  location: location
  properties: {
    securityRules: item.rules
  }
  tags: {
    Environment: 'dev'
    Location: 'westeurope'
  }
}]

resource loadBalancerName_publicip 'Microsoft.Network/publicIpAddresses@2020-08-01' = {
  name: '${loadBalancerName}-publicip'
  location: location
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    idleTimeoutInMinutes: 15
  }
  sku: {
    name: 'Standard'
  }
  zones: []
}

resource loadBalancer 'Microsoft.Network/loadBalancers@2021-05-01' = {
  name: loadBalancerName
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: '${loadBalancerName}-frontendconfig01'
        properties: {
          publicIPAddress: {
            id: loadBalancerName_publicip.id
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: backendPoolName
      }
    ]
    loadBalancingRules: [
      {
        name: '${loadBalancerName}-lbrule01'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', loadBalancerName, '${loadBalancerName}-frontendconfig01')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/loadBalancers/backendAddressPools', loadBalancerName, backendPoolName)
          }
          frontendPort: loadbalancingRuleFrontEndPort
          backendPort: loadbalancingRuleBackendEndPort
          enableFloatingIP: false
          idleTimeoutInMinutes: 15
          disableOutboundSnat: true
          loadDistribution: 'Default'
          protocol: loadbalancingRuleProtocol
          probe: {
            id: resourceId('Microsoft.Network/loadBalancers/probes', loadBalancerName, '${loadBalancerName}-probe01')
          }
        }
      }
    ]
    probes: [
      {
        name: '${loadBalancerName}-probe01'
        properties: {
          intervalInSeconds: 15
          numberOfProbes: 2
          requestPath: ((loadbalancingRuleProtocol == 'Tcp') ? null : '/')
          port: ((loadbalancingRuleProtocol == 'Tcp') ? loadbalancingRuleBackendEndPort : 80)
          protocol: ((loadbalancingRuleProtocol == 'Tcp') ? 'Tcp' : 'Http')
        }
      }
    ]
    inboundNatRules: [
      {
        name: '${loadBalancerName}-natRule01'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', loadBalancerName, '${loadBalancerName}-frontendconfig01')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/loadBalancers/backendAddressPools', loadBalancerName, backendPoolName)
          }
          protocol: 'TCP'
          enableFloatingIP: false
          enableTcpReset: false
          backendPort: 22
          frontendPortRangeStart: InboundNATRuleFrontEndPortRangeStart
          frontendPortRangeEnd: (InboundNATRuleFrontEndPortRangeStart + ((instanceCount == json('null')) ? 0 : 3599))
        }
      }
    ]
  }
  dependsOn: [
  ]
}

resource autoScaleResource 'Microsoft.Insights/autoscaleSettings@2021-05-01-preview' = {
  name: autoScaleResourceName
  location: location
  properties: {
    name: autoScaleResourceName
    targetResourceUri: vmssId
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: autoScaleMin
          maximum: autoScaleMax
          default: autoScaleDefault
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: vmssId
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT${durationTimeWindow}M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: scaleOutCPUPercentageThreshold
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: scaleOutInterval
              cooldown: 'PT1M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: vmssId
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: scaleInCPUPercentageThreshold
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: scaleInInterval
              cooldown: 'PT1M'
            }
          }
        ]
      }
    ]
    predictiveAutoscalePolicy: {
      scaleMode: predictiveAutoscaleMode
      scaleLookAheadTime: 'PT14M'
    }
  }
}

resource virtualMachineScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: virtualMachineScaleSetName
  location: location
  properties: {
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          createOption: 'fromImage'
          caching: 'ReadWrite'
          managedDisk: {
            storageAccountType: osDiskType
          }
        }
        imageReference: {
          publisher: 'canonical'
          offer: '0001-com-ubuntu-server-jammy'
          sku: '22_04-lts-gen2'
          version: 'latest'
        }
      }
      networkProfile: {
        networkApiVersion: networkApiVersion
        networkInterfaceConfigurations: [for item in networkInterfaceConfigurations: {
          name: item.name
          properties: {
            primary: item.primary
            enableAcceleratedNetworking: item.enableAcceleratedNetworking
            ipConfigurations: [
              {
                name: '${take(item.name, (80 - length('-defaultIpConfiguration')))}-defaultIpConfiguration'
                properties: {
                  subnet: {
                    id: item.subnetId
                  }
                  primary: item.primary
                  applicationGatewayBackendAddressPools: item.applicationGatewayBackendAddressPools
                  loadBalancerBackendAddressPools: item.loadBalancerBackendAddressPools
                  publicIPAddressConfiguration: ((item.pipName == '') ? json('null') : union(json('{"name": "${item.pipName}"}'), json('{"properties": { "idleTimeoutInMinutes": 15}}')))
                }
              }
            ]
            networkSecurityGroup: ((item.nsgId == '') ? json('null') : json('{"id": "${item.nsgId}"}'))
          }
        }]
      }
      extensionProfile: {
        extensions: []
      }
      diagnosticsProfile: {
        bootDiagnostics: {
          enabled: true
        }
      }
      osProfile: {
        computerNamePrefix: namingInfix
        adminUsername: adminUsername
        adminPassword: adminPassword
        linuxConfiguration: {
          disablePasswordAuthentication: false
          patchSettings: {
            patchMode: 'ImageDefault'
          }
        }
        customData: customData
      }
    }
    orchestrationMode: 'Flexible'
    platformFaultDomainCount: platformFaultDomainCount
  }
  sku: {
    name: instanceSize
    capacity: int(instanceCount)
  }
  tags: {
    Environment: 'dev'
    Location: 'westeurope'
  }
  dependsOn: [
    networkSecurityGroups_name
    loadBalancer
  ]
}

output adminUsername string = adminUsername
