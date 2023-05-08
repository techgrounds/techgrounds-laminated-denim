[Intro to Docker Containers](https://learn.microsoft.com/en-us/training/modules/intro-to-docker-containers/)  
[What are containers](https://cloud.google.com/learn/what-are-containers)  
[Azure Container Instances](https://learn.microsoft.com/en-us/azure/container-instances/container-instances-overview)  
[Describe Azure compute and networking services](https://learn.microsoft.com/en-us/training/modules/describe-azure-compute-networking-services/)  
[Tutorial for Azure Functions](https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-python?pivots=python-mode-configuration)

#### Containers
A container is a software package that contains all the tools necessary to run anywhere. They contain application code and its dependencies, such as programming language runtimes and libraries. They allow the software to run in a layer that is abstract from the actual environment.

Their benefits include:
* **Separation of responsibility:** This allows different teams to focus on different things. Developers can focus on the application, while operations can focus on deployment.
* **Workload portability:** Containers can run on practically any system, physical or virtual; on any OS, such as Linux, Windows or MacOS; even in the public cloud.
* **Application isolation:** Containers virtualise physical resources such as the CPU on the OS level, which provides a view of the OS that is logically isolated from other applications.

Containers are a more lightweight alternative to VMs. They virtualise at the OS level instead of the hardware level, and share the OS kernel, which means that they use much less memory than a VM.

#### Azure Container Instances
Azure Container Instances allow one to run containers in Azure without having to manage a VM or use another service. Benefits include fast startup times, potential internet access and an interactive shell. They offer application isolation, custom sizing, and are designed to run a single application. Container instances support linking with Azure Files and VNets.

#### Docker
Docker is a containerisation platform that can be used to develop, ship and run containers. Docker can run on a local machine, in server environments and the cloud. 

#### [Azure Functions](https://learn.microsoft.com/en-us/training/modules/describe-azure-compute-networking-services/6-functions)
Azure Functions is a serverless compute option that is activated by events. Instead of maintaining a VM or container, an event wakes the function and executes the underlying code. Upon completion, the compute resources are deallocated. Azure Functions supports stateless or stateful functionality. By default, Functions is stateless; it behaves as if it is restarted each time it activates. With stateful functionality enabled, it uses a context to track prior activity.

Its primary benefits are no VM management, autoscaling and a pay-for-what-you-use model.


#### Assignment:
