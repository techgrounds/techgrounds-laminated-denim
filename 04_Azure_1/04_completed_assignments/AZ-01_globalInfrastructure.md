# Azure Global Infrastructure
Azure global infrastructure refers to the physical architecture of the Azure Cloud. This is the datacentres and the way they are connected. 

#Azure/Architecture #Azure/Services #Azure/AZ-900

## Key-terms
#### Azure Regions
Azure regions are an umbrella term for the datacentres located in a region. For example, South Africa has two regions: South Africa North and South Africa West. These consist of multiple datacentres. 

There are also special Azure regions designated for compliance purposes, such as US DoD Central and regions in China. These are either operated by screened personnel or, in China's case, another company. These are called *Sovereign Regions.*

All datacentres within a region have no more than 2ms latency between another.

#### Azure Availability Zones
Availability zones ensure service and data redundancy by hosting these across a minimum of three discrete datacentres within a single region. This is [not available in every region.](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support?azure-portal=true) Availability zones are primarily used for VMs, load balancers, managed disks and SQL databases. There is typically a cost associated with this kind of duplication. Different subscriptions will map availability zones to different datacentres; AZ1 in one subscription might not map to the same datacentre as AZ1 in a second subscription. Azure services that support availability zones fall into three categories:
* **Zonal services:** Resources that are pinned to a specific zone (e.g. VMs, managed disks, IPs)
* **Zone-redundant services:** The platform replicates automatically across zones (e.g. zone-redundant storage, SQL database)
* **Non-regional services:** Services that are always available from Azure geographies; these are resilient to zone and region-wide outages.

#### [Azure Region Pairs](https://learn.microsoft.com/en-us/azure/reliability/cross-region-replication-azure)
Region pairs ensure redundancy in case of a major outage that could affect multiple datacentres in the same region. This is done by pairing a region with another in the same general geographical location that is located at least 482km (300 miles) away.

If multiple regions are affected by an outage, one region out of every pair is prioritised. Updates are also rolled out to one region in a pair at a time. Data also does not travel across borders, enabling legal compliance.

#### Other terms
##### Resources
Virtual instances of services created by an administrator, such as VMs, databases or storage. All resources require a resource group before they can be provided.

##### Resource groups
A logical container containing resources such as databases and web apps. A resource can only be part of a single resource group. Resources can be moved between groups, but some have limitations or requirements to do so.

Group resources of similar function or location together. The deletion of a resource group immediately deletes the resources within. Role-based access control ([RBAC](https://auth0.com/docs/manage-users/access-control/rbac)) permissions can also be applied to resource groups.

#### Resource tags
Resource tags offer another layer of management aside from subscriptions and resource groups to create structure and provide an overview of costs. They are not inherited. They can be tweaked through PowerShell, the Azure CLI, templates, the REST API or the Azure portal. Azure Policy can enforce the use of tags.

##### [Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview)
Azure Resource Manager offers management and deployment features that allow one to create, update and delete resources. Access control and tagging are also possible. Resource Manager authenticates and authorises requests other Azure tools and serves as an API. A JSON template (rather than a script) can be used to define what one wishes to deploy in the Resource Manager.

##### Subscriptions
A grouping of user accounts and the resources they have created. In this way a company can set limits on the resources used by a user or team. Accounts can have multiple subscriptions that each offer access to different Azure products and services.

Two different types of boundaries can be set:
* Billing boundary: billing reports and invoices can be generated per separate subscription.
* Access control boundary: access-management at the subscription level.

Individual subscriptions include hard limitations. For example, [Azure ExpressRoute](https://learn.microsoft.com/nl-nl/azure/expressroute/expressroute-introduction) is limited to 10 circuits per subscription.

##### Management groups
Management groups manage access, compliance and policies for multiple subscriptions. Subscriptions in a management group inherit the settings applied to the group. It is possible to create a hierarchy of management groups. The policies of a management group cannot be altered by those it governs. [RBACs](https://auth0.com/docs/manage-users/access-control/rbac) can be applied to management groups. Management groups support 6 levels of depth in their hierarchy, not including the root group or the subscription.

#### [Azure Lighthouse](https://learn.microsoft.com/en-us/azure/lighthouse/overview)
Azure Lighthouse is a service that allows one to monitor and manage deployments across multiple tenants. This is useful for service providers, application providers on the marketplace, and multi-tenant deployments. It offers centralised management.

## Opdracht
### Gebruikte bronnen
[Azure Architecture Fundamentals](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/)  
[Regions and zones](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/regions-availability-zones)  
[Resources and groups](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/resources-resource-manager)  
[Subscriptions and management groups](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/management-groups-subscriptions)  

### Ervaren problemen
* Where can I find this info?
	* Figure out how to smoothly navigate MS Learn.
		* Searching for AZ-900 returns a list of modules and learning paths suitable for this and following assignments. 
		* Searching for specific terminology should return documentation or modules on those subjects.
* How do I avoid diving too deep into a subject?
	* Refer to 04-AZ-04 for a list of subjects on the practice exam. 
	* Search for other sources that refer to subjects for the certification exam. 
	* Check the timeline.

### Resultaat
Choosing a region to host one's cloud services is a choice that comes down to a few factors. Location can determine:
1. The latency to reach the data centre.
2. The compliance of the data centre with any relevant laws.
3. The availability of certain services, such as region pairing.