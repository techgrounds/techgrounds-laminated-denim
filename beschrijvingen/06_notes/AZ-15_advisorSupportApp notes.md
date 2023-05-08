Advisor, Support Plans, App config

[Intro to Azure Advisor](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-advisor/)  
[John Savill: Functionaly and Usage of Azure Advisor](https://www.youtube.com/watch?v=nqH4NboyEl0)  
[Azure Support Plans](https://azure.microsoft.com/en-us/support/plans)  
[Overview of Azure App Configuration](https://learn.microsoft.com/en-us/azure/azure-app-configuration/overview)  



#### Azure Advisor
The Azure Advisor is a monitoring solution that evaluates Azure resources and suggests improvements based on the [Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/). It does this by analysing resource configuration and usage telemetry. Azure Advisor supports a limited selection of resources.

#### Azure Support Plans
There are four tiers of Azure Support Plans: Basic, Developer, Standard and Professional Direct.

##### Basic
Basic is included for all Azure customers for free. It does not feature third-party software support or 24/7 access to technical support by email and phone.

##### Developer
The developer tier features access to support after business hours by email. Minimal case severity and response time is within 8 business hours. It features general guidance for architecture support. It is intended for trial and non-production environments.

##### Standard tier
For incidents with minimal business impact, the response time is 8 hours. For moderate and critical instances it is 4 and 1 hour respectively. Is is intended for production workload environments.

##### Professional Direct
For case severity response times, Professional Direct features five, two and one hour for the tiers listed above. It features architecture support from a group of ProDirect delivery managers, a support API, operations support, training and proactive guidance. It is intended for purposes that have a business-critical dependence.

#### Azure App Configuration
Azure App Configuration is a service that provides a place for the central management of application settings. This is useful because of the otherwise distributed nature of the cloud. Configuration settings should be separated from application code. Azure App Configuration features the following benefits:

* Fully managed service.
* Tagging.
* Native integration with popular frameworks.

Azure App Configuration is useful with:
* Azure Key Vault
* Microservices based on Kubernetes, or other types of containerised apps.
* Serverless apps such as Azure Functions.
* A continuous deployment pipeline.