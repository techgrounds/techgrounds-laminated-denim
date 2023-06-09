[Fundamentals of Azure Cosmos DB](https://learn.microsoft.com/en-us/training/modules/explore-non-relational-data-stores-azure/)  
[MS Learn Azure Cosmos DB Lab](https://microsoftlearning.github.io/DP-900T00A-Azure-Data-Fundamentals/Instructions/Labs/dp900-03-cosmos-lab.html)  

##### Azure Cosmos DB
Cosmos DB is a globally distributed, multi-model database service. It works across Azure regions and supports many APIs and SLAs. It stores data in ARS (atom-record-sequence) format. This data is then abstracted and projected with an API, with your choices including SQL, MongoDB, Cassandra, Tables, and Gremlin. This ensures flexibility. It supports schemaless, non-relational data as well as relational data.

It is suited for the following scenarios:
* Internet of Things (IoT) and telematics (vehicle telemetry, for example.)
* Retail and marketing
* Gaming: stats, social media integration, leaderboards
* Web and mobile applications

##### Azure Cosmos DB for NoSQL
This model manages data in JSON document format and then uses SQL syntax to work with the data.

##### Azure cosmos DB for MongoDB
MongoDB is an open source database that uses the Binary JSON (BSON) format. Azure CosmosDB for MongoDB allows the use of MongoDB client libraries and code.

##### Azure Cosmos DB for PostgreSQL
Cosmos DB for PostgreSQL allows database scaling across multiple nodes as performance requirements increase. PostgreSQL is a relational database system.

##### Azure Cosmos DB for Table
Cosmos DB for Table offers greater scaling and performance than Azure Table Storage.

##### Azure Cosmos DB for Apache Cassandra
Apache Cassandra is another open source database that uses a column-family storage structure. It also supports SQL syntax.

##### Azure Cosmos DB for Apache Gremlin
Apache Gremlin is used for data in graph structure. Data entries form nodes that connect to others via relationships on these graphs.

#### Read-Replicas
Read-replicas are synchronised read-only replicas of one master database. This offers the benefit of low latency for the act of reading from the read-replica without complicating the process of writing data. All web servers write to the one master database.

#### Assignment:
* Establish theoretical knowledge of Azure Cosmos DB.
* Create a Cosmos DB account.
* Create a sample database in this account.
* Modify the data in the sample database.
* Query the database.

When creating an Azure Cosmos DB account, one is first prompted to select a service and database format from the list above. I chose for Azure CosmosDB for NoSQL. What followed was a standard Azure Portal resource creation process.

Once the resource had been created, I used the data explorer tab on the left to gain access to a quick start option which let me create a sample database. I added a new entry to the database and ran a simple query that returned the new entry.  
![ss1](../../00_includes/AZ-14_screenshot1.png)