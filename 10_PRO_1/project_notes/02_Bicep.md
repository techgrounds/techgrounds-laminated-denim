
# Deployment
```
New-AzResourceGroup -Name <rgName> -Location <region>
New-AzResourceGroupDeployment -ResourceGroupName rgName -TemplateFile main.bicep
```

Loading bash scripts from a private github repository is best practice.

# Bicep notes
* Learn resource naming restrictions before attempting to use them in Bicep.
* Bicep is strict regarding line breaks.
* Use consistent naming for parameters and variables.
* Be careful with default values; use inexpensive SKUs as defaults.

## Resources:
[Advanced Bicep Guide](https://github.com/nnellans/bicep-guide)  
[Create Network resources with Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/scenarios-virtual-networks)  
[Getting items from the keyvault](https://learn.microsoft.com/en-us/training/modules/build-reusable-bicep-templates-parameters/6-exercise-create-use-parameter-files?pivots=cli)
[Stackoverflow topic on running a script](https://stackoverflow.com/questions/74478948/post-deployment-bash-script-in-bicep-file-does-not-execute)  

### MS Recovery Service
[Backup Policy in Bicep](https://learn.microsoft.com/en-us/azure/templates/microsoft.recoveryservices/vaults/backuppolicies?pivots=deployment-language-bicep)  
[Backup config in Bicep](https://learn.microsoft.com/en-us/azure/templates/microsoft.recoveryservices/vaults/backupconfig?pivots=deployment-language-bicep)


## [Parameters and Variables](https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/5-add-flexibility-parameters-variables)
Parameters allow one to bring in values from outside a template file. A user deploying a template via CLI or PowerShell will be prompted to provide values for each parameter. A parameter file could also be used, which lists all parameters and corresponding values. Add parameters to the top of a template. Example: `param environmentName string`  
Example of a parameter with a default value that will be used if no value is specified: `param environmentName string = 'dev'`

Variables are defined and set within a template. This allows one to store and refer to key information that is reused throughout the template. They are useful for values that will be consistent throughout separate deployments, but reused in the template. They're also useful if one wishes to create complex values with expressions.

Parameters are useful for things that can change between deployments, such as:
* Resource names that must be unique.
* Resource locations.
* Settings that affect resource pricing such as SKUs, tiers and instances.
* Credentials and other information.

### Expressions
Expressions allow one to define more complicated instructions. For example: `param location string = resourceGroup().location` will create a parameter called *location* that equals the location of the resource group. If a resource uses the parameter, it is automatically deployed in the resource group's location.

String interpolation allows one to combine strings. For example, `param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'` combines the hard-coded string *toylaunch* with the output of the `uniqueString(resourceGroup().id)` function.

```
@allowed([
  'nonprod'
  'prod'
])
param environmentType string
```
The above allows one to specify allowed values for a parameter. Below shows this in use. `(environmentType == 'prod')` is a Boolean check; it is either true or false depending on which of the allowed values is used. `?` is a *ternary operator* and it evaluates an `if/then` statement. The value after the `?` operator is used if the expression is true; the value after the colon `:` is used if it is false.
```
var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2V3' : 'F1'
```

### Objects
Objects allow one to combine structured data. They can be used in resource definitions, variables or within expressions. An example: 
```
param appServicePlanSku object = {
  name: 'F1'
  tier: 'Free'
  capacity: 1
}
```
When referencing the parameter, one can select the object's properties by using a dot followed by the property's name. An example below:
```
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSku.name
    tier: appServicePlanSku.tier
    capacity: appServicePlanSku.capacity
  }
}
```
Resource tags are an ideal use for object parameters, given that tags might differ between environments but all resources in a template will typically reuse the same tags.

### Arrays
Arrays are lists of items. For example, an array of string values could define a list of email addresses to be used for alerts.
```
param cosmosDBAccountLocations array = [
  {
    locationName: 'australiaeast'
  }
  {
    locationName: 'southcentralus'
  }
  {
    locationName: 'westeurope'
  }
]
```

### Specifying or restricting parameter lengths and values
```
@allowed([
  'P1v3'
  'P2v3'
  'P3v3'
])
param appServicePlanSkuName string
```
One can use the above or below to specify restrictions on a parameter value. `@minLength` and `@maxLength` can also be used on arrays.
```
@minLength(5)
@maxLength(24)
param storageAccountName string@minLength(5)
@maxLength(24)
param storageAccountName string
```

### Comments
Descriptions allow one to add comments on parameters to explain what they do. If a bicep template is readable in the Azure Portal, the portal uses `@description` to assist users in understanding what parameter values need to be.
`@description('Text here.')`
`param cosmosDBAccountLocations array`

### Parameter Files
Parameter files allow one to specify parameter values as a set instead of requiring the user to input them into the CLI or PowerShell. They are created using JSON. Typically, one creates a parameter file for each environment. Good naming convention could be `main.parameters.dev.json`. An example follows:
```
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "appServicePlanInstanceCount": {
      "value": 3
    },
    "appServicePlanSku": {
      "value": {
        "name": "P1v3",
        "tier": "PremiumV3"
      }
    },
    "cosmosDBAccountLocations": {
      "value": [
        {
          "locationName": "australiaeast"
        },
        {
          "locationName": "southcentralus"
        },
        {
          "locationName": "westeurope"
        }
      ]
    }
  }
}
```
`$schema` identifies the file as a parameter file.
`contentVersion` is a property to keep track of changes in the parameter file. The default is `1.0.0.0`.
The `parameters` section lists every parameter and the values one wishes to utilise. The value must be specified as an object.

To use a parameter file:
```
New-AzResourceGroupDeployment `
  -TemplateFile main.bicep `
  -TemplateParameterFile main.parameters.json
```

## Outputs
Outputs allow for data from the template to be sent back to whoever or whatever is executing the deployment. This could be useful if one were to deploy a virtual machine, and needed the public IP for SSH access. Alternatively, one could output the result of a parameter so that it could be used in a deployment pipeline.
```
output appServiceAppName string = appServiceAppName
```
Outputs can use the same names as variables and parameters, which is useful if one needs to expose a variable's value as an output. It is best practice to use resource properties as an output, instead of assuming the end result and hardcoding it. Outputs should not be constructed from secret values.

## Modules
Modules allow one to break up Bicep code into smaller segments that can be combined into a template. Any Bicep template can be used as a module by another template.
```
module myModule 'modules/mymodule.bicep' = {
  name: 'MyModule'
  params: {
    location: location
  }
}
```
Key things to consider when creating modules are:

- **A module should have a clear purpose.** You can use modules to define all of the resources related to a specific part of your solution. For example, you might create a module that contains all of the resources used to monitor your application. You might also use a module to define a set of resources that belong together, like all of your database servers and databases.
- **Don't put every resource into its own module.** You shouldn't create a separate module for every resource you deploy. If you have a resource that has lots of complex properties, it might make sense to put that resource into its own module. But in general, it's better for modules to combine multiple resources.
- **A module should have clear parameters and outputs that make sense.** Consider the purpose of the module. Think about whether the module should manipulate parameter values, or whether the parent template should handle that, and then pass a single value through to the module. Similarly, think about the outputs a module should return, and make sure they're useful to the templates that will use the module.
- **A module should be as self-contained as possible.** If a module needs to use a variable to define a part of a module, the variable should generally be included in the module file rather than in the parent template.
- **A module should not output secrets.** Just like templates, don't create module outputs for secret values like connection strings or keys.

### Secrets and Modules
Bicep templates can use ARM to call on existing resources such as a Key Vault. One can use `existing` to reference an existing resource. `getSecret()` allows one to request a secret from the Key Vault.
```
resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' existing = {
  name: keyVaultName
}

module applicationModule 'application.bicep' = {
  name: 'application-module'
  params: {
    apiKey: keyVault.getSecret('ApiKey')
  }
}
```

## Conditions & Loops
Good idea to use variables to define the expressions used for a condition. e.g.
```
@allowed([
  'Development'
  'Production'
])
param environmentName string

var auditingEnabled = environmentName == 'Production'

resource auditingSettings 'Microsoft.Sql/servers/auditingSettings@2021-11-01-preview' = if (auditingEnabled) {
  parent: server
  name: 'default'
  properties: {
  }
}
```


## Troubleshooting:
[Target scope "subscription" does not match the deployment scope "resourceGroup"](https://github.com/Azure/bicep/issues/6323)
Using modules to define resource group scope? Idea from Akram.