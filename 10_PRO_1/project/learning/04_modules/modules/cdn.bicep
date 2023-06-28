param originHostName string

param profileName string = 'cdn-${uniqueString(resourceGroup().id)}'

param endpointName string = 'endpoint-${uniqueString(resourceGroup().id)}'

param httpsOnly bool

var originName = 'my-origin'

resource cdnProfile 'Microsoft.Cdn/profiles@2023-05-01' = {
  name: profileName
  location: 'global'
  sku: {
    name: 'Standard_Microsoft'
  }
}

resource endpoint 'Microsoft.Cdn/profiles/endpoints@2023-05-01' = {
  parent: cdnProfile
  name: endpointName
  location: 'global'
  properties: {
    originHostHeader: originHostName
    isHttpAllowed: !httpsOnly
    isHttpsAllowed: true
    queryStringCachingBehavior: 'IgnoreQueryString'
    contentTypesToCompress: [
      'text/plain'
      'text/html'
      'text/css'
      'application/x-javascript'
      'text/javascript'
    ]
    isCompressionEnabled: true
    origins: [
      {
        name: originName
        properties: {
          hostName: originHostName
        }
      }
    ]
  }
}



output endpointHostName string = endpoint.properties.hostName
