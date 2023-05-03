##### Study:
* App Service
* Content Delivery Networks
* Azure DNS

##### Assignment:
* Azure Files
	* What is this used for?
	* How do I use it?
	* How do I combine this with other resources?
* Azure Database (+ managed instance)
	* What is this used for?
	* How do I use it?
	* How do I combine this with other resources?

#### Azure App Service
Azure App Service is at its core a HTTP-based service for hosting web applications, REST APIs and mobile back ends. It supports multiple programming languages and both Windows and Linux environments. Key features include:
* **Autoscaling support.**
* **Continuous integration/deployment support:** App Service features integration and deployment with Azure DevOps Services, GitHub, BitBucket, FTP or local Git repositories. This allows App Service to auto-sync code once connected to a source.
* **Deployment slots:** on the Standard App Service Plan, one can deploy web apps to a separate deployment slot instead of the default production slot.

##### Azure App Service plans
App Service plans define the compute resources that an app requires to run. Upon creation, one selects a region and compute resources are created for the plan. Plans define the OS, region, the number and size of VM instances, and the pricing tier.



##### REST API
REST stands for 'representational state transfer.' A RESTful API is an API that follows a set of architectural constraints. It needs to conform to the following parameters:
* A client-server architecture that manages requests through HTTP.
* Stateless client-server communication, which means that no client information is stored between requests.
* Cacheable data.
* A uniform interface that ensures information is transmitted in a standard manner.
* A layered system that organises servers and requested information into hierarchies.

#### Azure Content Delivery Network
Azure CDN is a service that places content closer to clients attempting to access it across the world. It does this by caching data that is accessed on servers closer to the client. These locations are also known as a POP. CDNs are ideal for static content that is accessed by users worldwide. They have little benefit for dynamic or streamed content, or applications that only service users from a strict geographic area. Azure CDN is also capable of compression.

##### Point-of-presence
POP refers to server locations that host content repositories.

#### Azure DNS
Azure DNS is an alternative to an on-premises DNS server or a DNS registrar. It supports multiple file formats, can be integrated and managed with common Azure tools, and supports public and private zoning, which allows specific DNS records to be limited to private networks. Because of its integration with Azure management tools, Azure DNS can be more efficient than using an external DNS registrar with its own tools.

Managing one's own DNS server is a better option if one requires Active Directory Domain Services or support for DNSSEC.

#### Azure Files

#### Azure Database



[Intro to Azure CDN](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-content-delivery-network/)  
[Explore Azure App Service](https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-app-service/)  
[What is a REST API](https://www.redhat.com/en/topics/api/what-is-a-rest-api)  
[Intro to Azure DNS](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-dns/)  
[Azure Database fundamentals](https://learn.microsoft.com/en-us/training/modules/azure-database-fundamentals/)  
[Benefits and Usage of Storage Account Resources - John Savill](https://www.youtube.com/watch?v=b8BrfsxLSx8)  
[Benefits and Usage of Database Resources - John Savill](https://www.youtube.com/watch?v=4sQOF9fSOAU)  
