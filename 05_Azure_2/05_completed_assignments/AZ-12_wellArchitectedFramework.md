# Azure Well Architected Framework
The Azure Well Architected Framework defines the key components and metrics one can use to measure well-designed cloud architecture. These components are cost optimisation, operational excellence, performance efficiency, reliability and security.

#Azure/AZ-900 #Azure/Concepts 

## Key-terms
#### Cost Optimisation
Cost optimisation refers to the process of identifying inefficiencies in spending in order to make optimal use of funds. There are multiple steps one can undertake in order to do this, such as:
* Planning and estimating costs ahead of time in order to inform stakeholders.
* Provisioning with optimisation by selecting the appropriate services required for the workload and using discounts such as reserved instances and bring-your-own-license offers.
* Monitoring and analysing spending in order to identify anomalies and make adjustments.
* Maximising efficiency by removing waste, such as an underutilised VM or the manual execution of processes that could be automated.

#### Operational Excellence
Operational excellence is the process of monitoring, developing and automating processes to detect and respond to problems. Steps one can take to achieve operational excellence include:
* Designing and building with modern practices, such as DevOps and continuous integration.
* Using monitoring and analytics tools in order to maintain oversight over cost inefficiencies, technical issues, and areas for performance optimisation.
* The use of automation in order to reduce wasted hours and the potential for error.
* Testing deployment and ongoing operations regularly in order to identify security and performance issues.

#### Performance Efficiency
Performance efficiency is the process of designing architecture with scaling and performance at the forefront, so that resources are scaled on demand. This should take into account the following factors:
* Optimising network performance by choosing the correct networking and storage technologies for the architecture's requirements.
* Adding a messaging layer between services to ensure that if the receiving service is unable to keep up with demand, a buffer is created so that requests can be handled in the order they were received.
* Optimising storage performance by partitioning data intelligently and caching frequently accessed data or assets.
* Identifying performance bottlenecks by tracking user habits, resource utilisation and system health.
* Tracking application performance by examining errors, bad code and bottlenecks through performance-management tools.

#### Reliability
Reliability refers to designing cloud environments to be capable of handling failure at any level, and recovering from such failures in a timeframe that is acceptable to stakeholders. One should adhere to the following principles:
* The construction of a highly available architecture that is resistant to failure through redundancy on multiple levels, such as the use of a load balancer or the clustering of VMs.
* Building an architecture that can recover from failure by adhering to defined RPOs and RTOs.
	* Recovery Point Objective (RPO) refers to the maximum duration of data loss that is acceptable measured in time, such as "one hour of data.""
	* Recovery time objective refers to the maximum duration of downtime that is acceptable. This is also measured in time: for example, "an RTO of 4 hours."

#### Security
Security refers to the implementation of authentication, authorisation and other defences in order to safeguard data and processes. This needs to be applied from the ground-up, from the people at the organisation to the applications used. The layers one should consider when designing a security approach include:
* The physical security layer, which might include unauthorised personnel attempting access to a real-world facility.
* The policies and access layer, where authentication and authorisation for users occurs.
* The perimeter layer, which could experience DoS attacks.
* The networking layer, where attackers may take advantage of open ports to attempt brute-force access to a system.
* The VM/Compute layer, in which defending against malware is paramount.
* The application layer, where code injection such as SQL injection and cross-site scripting are common vectors for attack.
* The data layer, where the use of strong encryption and the proper storage of encryption keys is important.
![ss of shared security responsibility model](../../00_includes/AZ-12_screenshot1.png)

#### General design principles
* **Enable architectural evolution:** Implement methods to update the architecture as new services become available.
* **Data-driven decision making:** The collection, analysis and use of data to optimise decisions made around the architecture.
* **Educate and enable:** Proper documentation and sharing of configurations, decisions and best practices in order to educate co-workers.
* **Automation:** In order to increase consistency and reduce errors and costs, automation is important.

#### DevOps
DevOps is the process of cooperation between software development (dev) and operations (ops) teams to accelerate product delivery through automation, collaboration, feedback and iteration. It is built on Agile practices. Its key principles are:
* Automation of the software development cycle through automating testing, builds, releases and the provisioning of development environments.
* Collaboration and communication between coworkers and teams.
* Continuous improvement and minimisation of waste through automation of repetitive tasks and monitoring performance metrics.
* Hyperfocus on user needs with short feedback loops by taking advantage of the time granted by the above points.

## Opdracht
### Gebruikte bronnen
[Well Architected Framework documentation](https://learn.microsoft.com/en-us/azure/well-architected/)  
[Intro to Azure Well-Architected Framework](https://learn.microsoft.com/en-us/training/modules/azure-well-architected-introduction/)
[DevOps explanation](https://about.gitlab.com/topics/devops/)

### Ervaren problemen
##### Study:
* Well-Architected Framework (Reliability, security, cost optimisation, operational excellence & performance efficiency)
	* The assignment is entirely theoretical. I experienced no problems.
* How to implement the framework pillars with cloud services.
	* I wrote about the practical implementation of the framework if one were to create a media server.

### Resultaat
By planning an architecture ahead of time, one could implement the pillars reliably and prior to implementation. For example, if one required a media server that was accessible through the internet to 20 users, one could start by asking these questions:

* What is my budget?
* What Azure service is best suited to store and deliver video files to multiple users?
* What are the security requirements for these video files? Do they need to be encrypted, do access restrictions need to be implemented?
* What time of day is the server most likely to be used? Can cost optimisations be performed by implementing autoscaling? How long will the server be used? Would utilising a reservation be cost-efficient?
* How important is it to defend these video files against data loss? What level of data redundancy, RPO, and RTO is acceptable?
* How can we monitor the use of the server in order to continually optimise the architecture we've built?
