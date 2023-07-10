# Introduction
This document lays out a blueprint for the design of the project. It explains which services have been used and the reasoning behind these decisions. Deviations from the requirements and any assumptions made to improve the final product will be discussed. Furthermore, integration points and dependencies for chosen services within the architecture will be brought to light.

# Project Overview
Project Stafford consists of multiple Bicep templates and Powershell scripts. It is designed to deploy the following in an Azure cloud environment:
1. A webserver running Apache in Linux.
2. A management server running Windows Server.
3. Two peered virtual networks, their subnets and network security groups.
4. A database server attached to the webserver.
5. A storage account for all necessary data storage, including post-deployment scripts.
6. Backup services for the above.
7. A key vault for the secure storage of credentials.

By deploying these templates and scripts, system administration and security teams will have all they need to test and launch apps in a consistent, repeatable manner.

# Services Selected
## Networking
In accordance with the project requirements, two virtual networks have been created and peered to allow devices on one network to access devices on the other. Virtual Network 1 serves as the front end: attached to it are the virtual machine scale set running the webserver, and the application gateway that handles internet traffic accessing the webserver. Virtual Network 2 acts as a back-end: the management server, database and any virtual desktops deployed at a later date are connected to this. These networks are split into multiple subnets, with 10.10.10.0/24 and 10.10.20.0/24 assigned to VNet1 and VNet2 respectively.

Network security groups attached to each subnet account for the security of the connected Azure services and virtual machines. Specific configurations and requirements are listed under their respective resources below.

A decision was made to not deviate from the project requirements on the networking front. The proposed infrastructure serves for the security and traffic requirements of the project. 

## Management Server
The management server consists of a VM running the latest version of Windows Server, as well as its dependencies such as a NIC and public IP. Given the project's focus on cost efficiency, the decision was made to size the VM in a variable; this ensures that no accidental upsizing will occur and incur additional costs.  

The management server is accessible via the internet with RDP and SSH from a select number of public IP addresses. These are configured in an array and can be assigned in the parameter file. By doing so, one can finetune access permissions.

No deviations from the project requirements were deemed necessary, as the management server has a narrow focus.

## Webserver
The webserver is hosted on a virtual machine scale set with internet access controlled by an Application Gateway.

## Database

## Storage
A singular Storage Account hosts the post-deployment scripts and the project's other storage requirements. 

## Backups

## Key Vault
The Azure Key Vault created with the project hosts the encryption keys for disk storage and backups, as well as passwords for the servers. Due to the Azure tenant environment the project will be deployed to, a decision was made to use antiquated user access policies instead of role based access control. Limitations on rights granted in the Active Directory make this the only option for successful deployment.

The policies grant the disk encryption set used to encrypt the VMs the rights to encrypt, decrypt, wrap and unwrap keys. Furthermore they grant the person deploying global privileges over the Key Vault, ideal for testing.

## 

## 

# 