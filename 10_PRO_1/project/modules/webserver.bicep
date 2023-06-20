//Imported parameters
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

param Vnet1Identity string
param vnet1Subnet1Identity string
param StorageAccBlobEndpoint string
///////

//Parameters for the VMSS
@description('The name of the webserver VM scaleset.')
param webServerName string = '${take(envName, 3)}${take(location, 6)}websv${take(uniqueString(resourceGroup().id), 4)}'
@description('The SKU size for the VMSS.')
param webServerSku string = envName == 'dev' ? 'Standard_B1s' : 'Standard_B2s'
//////

//variables for VMSS
var instanceCount = 1
var vmssId = webServer.id

//variables for autoscaling
var autoScaleResourceName = '${webServerName}AutoScale'
var autoScaleDefault = '1'
var autoScaleMin = '1'
var autoScaleMax = '3'
var durationTimeWindow = 10
var predictiveAutoscaleMode = 'ForecastOnly'
var scaleOutCPUPercentageThreshold = 75
var scaleInCPUPercentageThreshold = 25
var scaleOutInterval = '1'
var scaleInInterval = '1'
///////

// Autoscaling resource for the vmss
resource autoScaleResource 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
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

// A virtual machine scale set
resource webServer 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: webServerName
  location: location
  tags: {
    Environment: envName
    Location: location
  }
  sku: {
    capacity: int(instanceCount)
    name: webServerSku
    tier: 'Standard'
  }
  extendedLocation: {
    name: 'string'
    type: 'EdgeZone'
  }
  identity: {
    type: 'SystemAssigned'
    userAssignedIdentities: {}
  }
  plan: {
    name: 'string'
    product: 'string'
    promotionCode: 'string'
    publisher: 'string'
  }
properties: {
    additionalCapabilities: {
      hibernationEnabled: bool
      ultraSSDEnabled: bool
    }
    automaticRepairsPolicy: {
      enabled: bool
      gracePeriod: 'string'
      repairAction: 'string'
    }
    constrainedMaximumCapacity: bool
    doNotRunExtensionsOnOverprovisionedVMs: bool
    hostGroup: {
      id: 'string'
    }
    orchestrationMode: 'string'
    overprovision: bool
    platformFaultDomainCount: int
    priorityMixPolicy: {
      baseRegularPriorityCount: int
      regularPriorityPercentageAboveBase: int
    }
    proximityPlacementGroup: {
      id: 'string'
    }
    scaleInPolicy: {
      forceDeletion: bool
      rules: [
        'string'
      ]
    }
    singlePlacementGroup: bool
    spotRestorePolicy: {
      enabled: bool
      restoreTimeout: 'string'
    }
    upgradePolicy: {
      automaticOSUpgradePolicy: {
        disableAutomaticRollback: bool
        enableAutomaticOSUpgrade: bool
        useRollingUpgradePolicy: bool
      }
      mode: 'string'
      rollingUpgradePolicy: {
        enableCrossZoneUpgrade: bool
        maxBatchInstancePercent: int
        maxSurge: bool
        maxUnhealthyInstancePercent: int
        maxUnhealthyUpgradedInstancePercent: int
        pauseTimeBetweenBatches: 'string'
        prioritizeUnhealthyInstances: bool
        rollbackFailedInstancesOnPolicyBreach: bool
      }
    }
    virtualMachineProfile: {
      applicationProfile: {
        galleryApplications: [
          {
            configurationReference: 'string'
            enableAutomaticUpgrade: bool
            order: int
            packageReferenceId: 'string'
            tags: 'string'
            treatFailureAsDeploymentFailure: bool
          }
        ]
      }
      billingProfile: {
        maxPrice: json('decimal-as-string')
      }
      capacityReservation: {
        capacityReservationGroup: {
          id: 'string'
        }
      }
      diagnosticsProfile: {
        bootDiagnostics: {
          enabled: bool
          storageUri: 'string'
        }
      }
      evictionPolicy: 'string'
      extensionProfile: {
        extensions: [
          {
            name: 'string'
            properties: {
              autoUpgradeMinorVersion: bool
              enableAutomaticUpgrade: bool
              forceUpdateTag: 'string'
              protectedSettings: any()
              protectedSettingsFromKeyVault: {
                secretUrl: 'string'
                sourceVault: {
                  id: 'string'
                }
              }
              provisionAfterExtensions: [
                'string'
              ]
              publisher: 'string'
              settings: any()
              suppressFailures: bool
              type: 'string'
              typeHandlerVersion: 'string'
            }
          }
        ]
        extensionsTimeBudget: 'string'
      }
      hardwareProfile: {
        vmSizeProperties: {
          vCPUsAvailable: int
          vCPUsPerCore: int
        }
      }
      licenseType: 'string'
      networkProfile: {
        healthProbe: {
          id: 'string'
        }
        networkApiVersion: '2020-11-01'
        networkInterfaceConfigurations: [
          {
            id: 'string'
            name: 'string'
            properties: {
              deleteOption: 'string'
              disableTcpStateTracking: bool
              dnsSettings: {
                dnsServers: [
                  'string'
                ]
              }
              enableAcceleratedNetworking: bool
              enableFpga: bool
              enableIPForwarding: bool
              ipConfigurations: [
                {
                  id: 'string'
                  name: 'string'
                  properties: {
                    applicationGatewayBackendAddressPools: [
                      {
                        id: 'string'
                      }
                    ]
                    applicationSecurityGroups: [
                      {
                        id: 'string'
                      }
                    ]
                    loadBalancerBackendAddressPools: [
                      {
                        id: 'string'
                      }
                    ]
                    loadBalancerInboundNatPools: [
                      {
                        id: 'string'
                      }
                    ]
                    primary: bool
                    privateIPAddressVersion: 'string'
                    publicIPAddressConfiguration: {
                      name: 'string'
                      properties: {
                        deleteOption: 'string'
                        dnsSettings: {
                          domainNameLabel: 'string'
                        }
                        idleTimeoutInMinutes: int
                        ipTags: [
                          {
                            ipTagType: 'string'
                            tag: 'string'
                          }
                        ]
                        publicIPAddressVersion: 'string'
                        publicIPPrefix: {
                          id: 'string'
                        }
                      }
                      sku: {
                        name: 'string'
                        tier: 'string'
                      }
                    }
                    subnet: {
                      id: 'string'
                    }
                  }
                }
              ]
              networkSecurityGroup: {
                id: 'string'
              }
              primary: bool
            }
          }
        ]
      }
      osProfile: {
        adminPassword: 'string'
        adminUsername: 'string'
        allowExtensionOperations: bool
        computerNamePrefix: 'string'
        customData: 'string'
        linuxConfiguration: {
          disablePasswordAuthentication: bool
          enableVMAgentPlatformUpdates: bool
          patchSettings: {
            assessmentMode: 'string'
            automaticByPlatformSettings: {
              rebootSetting: 'string'
            }
            patchMode: 'string'
          }
          provisionVMAgent: bool
          ssh: {
            publicKeys: [
              {
                keyData: 'string'
                path: 'string'
              }
            ]
          }
        }
        requireGuestProvisionSignal: bool
        secrets: [
          {
            sourceVault: {
              id: 'string'
            }
            vaultCertificates: [
              {
                certificateStore: 'string'
                certificateUrl: 'string'
              }
            ]
          }
        ]
        windowsConfiguration: {
          additionalUnattendContent: [
            {
              componentName: 'Microsoft-Windows-Shell-Setup'
              content: 'string'
              passName: 'OobeSystem'
              settingName: 'string'
            }
          ]
          enableAutomaticUpdates: bool
          enableVMAgentPlatformUpdates: bool
          patchSettings: {
            assessmentMode: 'string'
            automaticByPlatformSettings: {
              rebootSetting: 'string'
            }
            enableHotpatching: bool
            patchMode: 'string'
          }
          provisionVMAgent: bool
          timeZone: 'string'
          winRM: {
            listeners: [
              {
                certificateUrl: 'string'
                protocol: 'string'
              }
            ]
          }
        }
      }
      priority: 'string'
      scheduledEventsProfile: {
        osImageNotificationProfile: {
          enable: bool
          notBeforeTimeout: 'string'
        }
        terminateNotificationProfile: {
          enable: bool
          notBeforeTimeout: 'string'
        }
      }
      securityProfile: {
        encryptionAtHost: bool
        securityType: 'string'
        uefiSettings: {
          secureBootEnabled: bool
          vTpmEnabled: bool
        }
      }
      serviceArtifactReference: {
        id: 'string'
      }
      storageProfile: {
        dataDisks: [
          {
            caching: 'string'
            createOption: 'string'
            deleteOption: 'string'
            diskIOPSReadWrite: int
            diskMBpsReadWrite: int
            diskSizeGB: int
            lun: int
            managedDisk: {
              diskEncryptionSet: {
                id: 'string'
              }
              securityProfile: {
                diskEncryptionSet: {
                  id: 'string'
                }
                securityEncryptionType: 'string'
              }
              storageAccountType: 'string'
            }
            name: 'string'
            writeAcceleratorEnabled: bool
          }
        ]
        diskControllerType: 'string'
        imageReference: {
          communityGalleryImageId: 'string'
          id: 'string'
          offer: 'string'
          publisher: 'string'
          sharedGalleryImageId: 'string'
          sku: 'string'
          version: 'string'
        }
        osDisk: {
          caching: 'string'
          createOption: 'string'
          deleteOption: 'string'
          diffDiskSettings: {
            option: 'Local'
            placement: 'string'
          }
          diskSizeGB: int
          image: {
            uri: 'string'
          }
          managedDisk: {
            diskEncryptionSet: {
              id: 'string'
            }
            securityProfile: {
              diskEncryptionSet: {
                id: 'string'
              }
              securityEncryptionType: 'string'
            }
            storageAccountType: 'string'
          }
          name: 'string'
          osType: 'string'
          vhdContainers: [
            'string'
          ]
          writeAcceleratorEnabled: bool
        }
      }
      userData: 'string'
    }
    zoneBalance: bool
  }
  zones: [
    'string'
  ]
}
