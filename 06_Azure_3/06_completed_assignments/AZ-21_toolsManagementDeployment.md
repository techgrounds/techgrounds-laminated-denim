# Features and tools for managing and deploying Azure resources
Azure tools for managing and deploying Azure resources allow for the automisation of management and deployment. This saves on labour costs.

## Key-terms
#### Azure Portal
The Azure Portal is a web-based console and GUI. It is an alternative to CLI tools.

#### Azure Cloud Shell
The Cloud Shell is a browser-based shell tool for the creation, configuration and management of Azure resources. It supports Azure PowerShell and Azure Command Line Interface, which is a Bash shell. It can be accessed via the Azure Portal by clicking the Cloud Shell icon in the top toolbar. Benefits include:
* Browser-based shell, requiring no local installation.
* Authentication via existing Azure credentials.
* Choice between Azure PowerShell and the Bash-based Azure CLI.

#### Azure PowerShell
Azure PowerShell allows for the execution of commands called command-lets (cmdlets.) These commands use the REST API for management tasks in Azure. They can be run independently or combined for more complex tasks. Using these commands in a script allows these processes to be repeated and automated.

Azure PowerShell can also be installed and configured on Windows, Linux and Mac. MS recommends PowerShell 7.x or later, PowerShell 5.1 or later is compatible on Windows, and PowerShell 6.2.4 is compatible on Mac and Linux.

#### Azure CLI
The Azure CLI is functionally identical to Azure PowerShell, with the primary difference being command syntax. It can also be installed on Windows, Linux and Mac.

#### Azure Arc
Azure Arc offers a way to use Azure Resource Manager (ARM) to monitor hybrid and multi-cloud configurations. It does this by:
* Projecting non-Azure resources into ARM for easy management.
* Allowing for the management of multi-cloud, hybrid VMs, Kubernetes clusters and databases as if they were running in Azure.
* The continuation of traditional [ITOps](https://www.ibm.com/topics/it-operations) alongside DevOps.
* The configuration of custom locations as an abstraction layer over Azure Arc-enabled Kubernetes clusters and cluster extensions.

Azure Arc allows for the management of the following resource types outside of Azure: Servers, Kubernetes clusters, Azure data services, SQL servers, and VMs.

#### Azure Resource Manager
Azure Resource Manager offers management and deployment features that allow one to create, update and delete resources. Access control and tagging are also possible. Resource Manager authenticates and authorises requests from other Azure tools and serves as an API. 

#### Infrastructure as code
Infrastructure as code is  where ones manages infrastructure with lines of code. Examples include management via Cloud Shell, PowerShell, Azure CLI or ARM templates.

##### ARM templates
ARM templates describe resources that need to be created in a declarative JSON format. This allows for the simultaneous creation and connection of these resources. The developer or IT professional defines the state and configuration of each resource in the template and the template executes based on these definitions. Templates can also execute PowerShell or Bash scripts before or after resources have been set up.

* **Declarative syntax:** This means that one can declare what resources should be deployed without writing the actual code and sequencing for the deployment.
* **Modular files:** Templates can be broken down into smaller components that can be linked together at the time of deployment. This could include nesting one template inside another.

## Opdracht
### Gebruikte bronnen
[Describe features and tools for managing and deploying Azure resources](https://learn.microsoft.com/en-us/training/modules/describe-features-tools-manage-deploy-azure-resources/)


