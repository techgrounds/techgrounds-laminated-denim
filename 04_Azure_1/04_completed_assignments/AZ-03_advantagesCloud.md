# Advantages of the cloud
Cloud computing features a number of advantages over on-premises infrastructure. Chief among these are availability, scalability, reliability and predictability.

#Azure/Concepts #Azure/AZ-900
## Key-terms
#### High availability
High availability is one advantage of cloud computing. Due to resources being spread across multiple datacentres, downtime is unlikely. Service availability guarantees offered in Azure offer a cost-to-uptime tradeoff via [SLAs](https://learn.microsoft.com/en-us/training/modules/describe-benefits-use-cloud-services/2-high-availability-scalability-cloud). Some Azure services have different guarantees than others.

Problems that can occur that a cloud provider will try to mitigate include:
* Network outages
* Application failure. In some scenarios, the customer will be responsible for these. Cloud providers typically provide diagnostic tools.
* System outage
* Power outage, by use of batteries or cross-region hosting.

#### Scalability
Scalability in the cloud allows one to adjust the available resources to meet demand. This could be to meet unexpected peak traffic, but also to shut off and not pay for resources that aren't needed. Scaling can be either vertical or horizontal. Vertical scaling refers to increasing or decreasing the capability of a resource, for example by adding more CPUs to a VM. Horizontal scaling refers to increasing or reducing the amount of resources, for example by adding more VMs. Scaling up can also add additional features such as SSDs.

#### Elasticity
Elasticity refers to the ability of the cloud to automatically scale processing, memory or storage resources to meet demand. This is independent of prior planning and requires no engineering for peak usage. It is usually controlled by system monitoring tools and automatically matches resources to demand without an interruption in service. A financial benefit is that a company does not need to pay for unused resources or make a CapEx investment.

[Auto-Scale](https://learn.microsoft.com/en-us/azure/architecture/best-practices/auto-scaling) is a feature of Azure that can automatically scale applications based on usage patterns.

#### Agility
Agility refers to the speed with which scaling is possible. For example, if one requires more VMs these VMs can be launched within seconds of making the request. 

#### Predictability
Predictability in the cloud is given by features such as *Stock-Keeping Units* (SKUs), which define the variations of certain products. For example, by comparing Azure Compute Units (ACUs) across SKUs. Templates also offer predictability, by allowing for things to always be deployed in the same way. Automation helps with this.

#### Geo-distribution
Geo-distribution refers to the geographic distribution of datacentres. Advantages include availability, latency, redundancy, and compliance.

#### Fault tolerance and disaster recovery
[Fault tolerance in Azure](https://learn.microsoft.com/en-us/archive/msdn-magazine/2015/september/microsoft-azure-fault-tolerance-pitfalls-and-resolutions-in-the-cloud) refers to the cloud provider's management of VMs and physical hardware to mitigate small-scale failures. For example, moving a customer from an unhealthy VM to a healthy one.

Disaster recovery refers to things such as data backups and the infrastructure the cloud provides to recreate resources in another unaffected region. This ensures continued availability of data and applications even in the event of disaster. 

#### Service Level Agreements
SLAs refer to the agreements Microsoft has with its customers regarding uptime of Azure services. Many factors can influence the SLA rating: for example, two VM instances spread across two availability zones have an SLA of 99.99%. If these VMs are reliant on other services to run, such as a storage account, their combined SLA is referred to as a *composite SLA.* Logically, this composite SLA is a lower uptime than the SLA of the storage account or VMs. If the VMs have access to alternative resources they can use instead of the storage account, the composite SLA will be significantly improved.

#### Consumption-based model
The consumption-based model is as its name indicates: a pricing model that does not require upfront investment but is rather based on dynamic scaling based on an organisation's requirements. Benefits include paying for extra resources as needed, or the ability to halt those resources when they're no longer necessary.

#### Public Cloud
Azure is an example of a public cloud. By definition, it is computing offered by a third-party provider via the internet. Benefits include almost limitless scaling, many regions, and many services.

#### Private Cloud
A private cloud is a cloud based on a private datacentre. Being that this requires ownership of the physical infrastructure, this is a CapEx investment.

#### Hybrid Cloud
A hybrid cloud is a combination use of public and private clouds. This could be using an Azure-based load balancer for peak usage, or the public cloud for data backups. Advantages include control, flexibility, cost-effectiveness and ease.

## Opdracht
### Gebruikte bronnen
[Describe benefits of cloud services](https://learn.microsoft.com/en-us/training/modules/describe-benefits-use-cloud-services/)  
[Elastic Computing](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-elastic-computing)  
[Benefits of cloud services, Exam Ref AZ-900](https://www.microsoftpressstore.com/articles/article.aspx?p=2979073)  
[Differences between types of cloud computing](https://www.youtube.com/watch?v=7dlCrF2wmXU)

### Ervaren problemen
The assignment was theoretical. I could not find any sources referencing geo-distribution, but the [AZ-01](AZ-01_globalInfrastructure) assignment filled in the blanks.

### Resultaat
I built a basis of knowledge on the 6 advantages of the cloud as named by Azure.
