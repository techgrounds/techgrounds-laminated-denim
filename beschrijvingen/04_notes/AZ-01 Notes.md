#### Azure Regions
Azure regions are an umbrella term for the datacenters located in a region. For example, South Africa has two regions: South Africa North and South Africa West. These consist of multiple datacenters.

There are also special Azure regions designated for compliance purposes, such as US DoD Central and regions in China. These are either operated by screened personnel or, in China's case, another company.

#### Azure Availability Zones
Availability zones ensure service and data redundancy  by hosting these across a minimum of three discrete datacenters within a single region. This is [not available in every region.](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support?azure-portal=true)

Availability zones are primarily used for VMs, load balancers, managed disks and SQL databases. There is typically a cost associated with this kind of duplication.

#### [Azure Region Pairs](https://learn.microsoft.com/en-us/azure/reliability/cross-region-replication-azure)
Region pairs ensure redundancy in case of a major outage that could affect multiple datacenters in the same region. This is done by pairing a region with another in the same general geographical location that is located at least 482km (300 miles) away.

If multiple regions are affected by an outage, one region out of every pair is prioritised. Updates are also rolled out to one region in a pair at a time. Data also does not travel across borders, enabling legal compliance.

#### Other terms
##### Resources
Virtual instances of services created by an administrator, such as VMs, databases or storage. All resources require a resource group before they can be provided.

##### Resource groups
A logical container containing resources such as databases and web apps. A resource can only be part of a single resource group. Resources can be moved between groups, but some have limitations or requirements to do so.

Group resources of similar function or location together. The deletion of a resource group immediately deletes the resources within. Role-based access control ([RBAC](https://auth0.com/docs/manage-users/access-control/rbac)) permissions can also be applied to resource groups.

##### [Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/overview)
Azure Resource Manager offers management and deployment features that allow one to create, update and delete resources. Access control and tagging are also possible. Resource Manager authenticates and authorises requests other Azure tools and serves as an API. A JSON template (rather  than a script) can be used to define what one wishes to deploy in the Resource Manager.

##### Subscriptions
A grouping of user accounts and the resources they have created. In this way a company can set limits on the resources used by a user or team. Accounts can have multiple subscriptions that each offer access to different Azure products and services.

Two different types of boundaries can be set:
* Billing boundary: billing reports and invoices can be generated per separate subscription.
* Access control boundary: access-management at the subscription level.

Indivual subscriptions include hard limitations. For example, [Azure ExpressRoute](https://learn.microsoft.com/nl-nl/azure/expressroute/expressroute-introduction) is limited to 10 circuits per subscription.

##### Management groups
Management groups manage access, compliance and policies for multiple subscriptions. Subscriptions in a management group inherit the settings applied to the group. It is possible to create a hierarchy of management groups. The policies of a management group cannot be altered by those it governs. [RBACs](https://auth0.com/docs/manage-users/access-control/rbac) can be applied to management groups.





Why would you choose one region above another?

* Where can I find this info?
	* Figure out how to smoothly navigate MS Learn.
		* Searching for AZ-900 returns a list of modules and learning paths suitable for this and following assignments. In addition, searching for specific terminology should return documentation or modules on those subjects.
* How do I avoid diving too deep into a subject?
	* Refer to 04-AZ-04 for a list of subjects on the practice exam. Search for other sources that refer to subjects on the actual exam.

[Azure Architecture Fundamentals](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/)
[Regions and zones](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/regions-availability-zones)
[Resources and groups](https://learn.microsoft.com/en-us/training/modules/azure-architecture-fundamentals/resources-resource-manager)