##### Study:
* 6 advantages of the cloud
* The consumption-based model


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

#### Geo-distribution
Geo-distribution refers to the geographic distribution of datacentres. Advantages include availability, latency, redundancy, and compliance.

#### Fault tolerance and disaster recovery
[Fault tolerance in Azure](https://learn.microsoft.com/en-us/archive/msdn-magazine/2015/september/microsoft-azure-fault-tolerance-pitfalls-and-resolutions-in-the-cloud) refers to the cloud provider's management of VMs and physical hardware to mitigate small-scale failures. For example, moving a customer from an unhealthy VM to a healthy one.

Disaster recovery refers to things such as data backups and the infrastructure the cloud provides to recreate resources in another unaffected region. This ensures continued availability of data and applications even in the event of disaster. 

#### Consumption-based model
The consumption-based model is as its name indicates: a pricing model that does not require upfront investment but is rather based on dynamic scaling based on an organisation's requirements. Benefits include paying for extra resources as needed, or the ability to halt those resources when they're no longer necessary.


[Describe benefits of cloud services](https://learn.microsoft.com/en-us/training/modules/describe-benefits-use-cloud-services/)  
[Elastic Computing](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-elastic-computing)  
[Benefits of cloud services, Exam Ref AZ-900](https://www.microsoftpressstore.com/articles/article.aspx?p=2979073)  
