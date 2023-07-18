# Project Stafford - Readme

## Overview

This repository contains a set of Bicep modules designed to deploy a variety of resources needed to host a basic webserver and back up important data.

## Prerequisites

Before you begin, ensure you have the following prerequisites in place:

1. **Azure PowerShell**: [Ensure you have the latest version of Azure PowerShell installed on your local machine.](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell?view=azps-10.1.0)

## Usage

### 1. Create a Resource Group

Before deploying the Bicep modules, you need to create an Azure Resource Group in which the resources will be provisioned. Use the following PowerShell command to create the Resource Group:

`# Replace <your-resource-group-name> and <azure-region> with appropriate values 
`New-AzResourceGroup -Name <your-resource-group-name> -Location <azure-region>`

### 2. Deploy the Bicep Modules

To deploy the Bicep modules, run the following PowerShell command:

`# Replace <your-resource-group-name> and <path-to-main.bicep> with appropriate values 
`New-AzResourceGroupDeployment -ResourceGroupName <your-resource-group-name> -TemplateFile <path-to-main.bicep>`

**Note**: If the deployment requires any additional parameters or configurations, specify them using the `-TemplateParameterObject` parameter in the above command. Use `-TemplateParameterFile <path-to-parameters-file>` to add the parameter file included in the repository.

Deployment should take around fifteen minutes.

Thank you and good luck!
