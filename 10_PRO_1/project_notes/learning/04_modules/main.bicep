param location string = 'westus3'

param appServiceAppName string = 'toy-${uniqueString(resourceGroup().id)}'

param appServicePlanSkuName string = 'F1'

param deployCdn bool = true

module app 'modules/app.bicep' = {
  name: 'toy-launch-app'
  params: {
    appServiceAppName: appServiceAppName
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    location: location
  }
}

module cdn 'modules/cdn.bicep' = if (deployCdn) {
  name: 'toy-launch-cdn'
  params: {
    httpsOnly: true
    originHostName: app.outputs.appServiceAppHostName 
  }
}

var appServicePlanName = 'toy-product-launch-plan'

output websiteHostName string = deployCdn ? cdn.outputs.endpointHostName : app.outputs.appServiceAppHostName
