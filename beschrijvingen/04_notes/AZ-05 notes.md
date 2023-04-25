##### Assignment 1:
* Create an Azure Storage Account only I have access to.
	* Read about Azure Storage Accounts.
		* Read about data objects such as blobs, files, disks and tables.
* Place data in a storage service of my choice via the console.
	* This involved first creating a container, then uploading an image.
* Download this data to my PC via Azure Storage Explorer
	* Read about Azure Storage Explorer.

##### Assignment 2:
* Create a new container.
	* Read about containers in Azure.
* Upload the 4 files that form the AWS Demo Website
	* Use google to find the files.
		* These ended up being located on the Drive.
* Ensure Static Website Hosting is on.
* Share the URL with a teammate and check if they can see the website.

#### Azure Storage
Azure offers different manners to store data, such as Azure SQL Database, Azure Cosmos DB and Azure Table Storage. Messaging is handled by Azure Queues and Event Hubs. Loose files can be stored by services such as Azure Files and Azure Blobs. Azure groups Azure Blobs, Azure Files, Azure Queues, and Azure Tables together under the header *Azure Storage.*

#### Storage account
A storage account is a container that groups multiple Storage services together. Only *Azure Storage* services can be added to an account. A storage account allows one to configure these services as a group. A storage account is an Azure resource and can be part of a resource group.  
![ss of typical setup](../../00_includes/AZ-05_screenshot1.png)  

#### Redundancy
Azure automatically maintains three backups in the datacentre associated with a storage account. This is called LRS, locally redundant storage. ZRS stands for zone redundant storage, which distributes the backups over 3 datacentres in one region. GRS stands for geo-redundant storage, which backs up data over a region pair. The latter two options have associated costs.





[Create an Azure Storage account](https://learn.microsoft.com/en-us/training/modules/create-azure-storage-account/)
[Azure Storage Explorer tutorial](https://learn.microsoft.com/en-us/training/modules/upload-download-and-manage-data-with-azure-storage-explorer/)
[Azure Storage Explorer download](https://azure.microsoft.com/en-us/products/storage/storage-explorer/)

Google security whitepaper for azure storage.
* Principle of least privilege.
* Encryp/secure data.
* Delete storage account after finishing assignment.