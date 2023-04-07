[Description of the OSI model with practical examples.](https://tryhackme.com/room/osimodelzi)  
[An alternative source for the OSI model.](https://www.javatpoint.com/osi-model)  
[Description of the TCP/IP model with practical examples.](https://tryhackme.com/room/packetsframes)  
[OSI layer protocols.](https://www.techopedia.com/definition/24961/osi-protocols)  
[SAP](https://www.techopedia.com/definition/25846/session-announcement-protocol-sap)
[L2TP](https://www.techtarget.com/searchnetworking/definition/Layer-Two-Tunneling-Protocol-L2TP)
[PDU](https://www.techopedia.com/definition/25292/protocol-data-unit-pdu)

Study the OSI model and its uses.
* What is the OSI model?
	* Solve this by working top to bottom. Read and take notes from two sources per topic/layer.
* What is the OSI model used for?
	* Search for practical examples.

The TCP/IP model and its uses.
* What is the TCP/IP model?
	* 
* What is the TCP/IP model used for?

##### Note for NTW-03
* Name at least one protocol per OSI layer.


## OSI model
The Open Systems Interconnection Model. Developed by the International Organization for Standardization, it is is a theoretical model that explains how data flows from a program on one computer to another. It consists of seven layers, each of which has a different duty.

### Layers
The OSI model's layers can be split into two sections: upper layers and lower layers. Layers 4-7 are software related. Layers 1-3 handle the transportation of data from one machine to another. 

#### Layer 7: Application
The software or GUI layer. This layer allows users to interact with the data. Examples include web browsers, e-mail, or even the DNS Protocol.

##### DNS
Domain Name System. A protocol that assigns domain names (website URLs) to IP addresses.

##### HTTP
Hypertext Transfer Protocol. A protocol that serves as the bedrock for the World Wide Web.

#### Layer 6: Presentation
The presentation layer serves to translate information from the application layer so that the presentation layer on the other end can understand it. Functions such as encryption and compression occur on this layer. Once the data has been formatted, it travels to the session layer.

##### TLS
Transport Layer Security, or TLS, is a protocol that secures communication over a network. Typically used in e-mail, VoIP and HTTPS.

##### SSL
Secure Sockets Layer allows for the creation of an encrypted connection between a server and a client. For example, a web server and a browser. It has been superseded by by the TLS protocol in many scenarios.

#### Layer 5: Session
The session layer establishes an active connection between two machines, synchronising them. This allows for checks on the data that is being sent and received. Furthermore, the session layer divides data into smaller packets. If an error happens in the middle of a data transmission, these two features allow recovery by requiring only the lost data to be resent.

##### Packets
A small piece of a larger chunk of data. Data transmitted via networks is sent as packets, which are then reconstituted into a whole by the receiving device. See also: #PDU and #encapsulation

##### SAP
Session Announcement Protocol. A protocol used for multicast session information, where one device sends information to a multitude of different machines. 

##### L2TP
Layer Two Tunneling Protocol. This protocol is used by VPNs to provide encryption of a handshake message.


#### Layer 4: Transport
The Transport layer is the layer that ensures the complete transmission of data. It takes data from upper layers and converts it into segments. Using the *TCP* and *UDP* protocols, the Transport layer creates a reliable connection that safeguards against data duplication.

##### TCP
The Transmission Control Protocol allows for communication over the internet. It's designed to create a connection that lasts until all data has been transmitted. Furthermore, the protocol safeguards against data corruption by checking for errors. It is commonly used for browsing the internet and file sharing, due to its accurate nature.

##### UDP
The User Datagram Protocol is designed for a faster transfer of data. By not synchronising the connection between two devices or checking the received data for errors, it trades accuracy for efficiency. This is useful for activities that require large amounts of data to be sent where some corruption is unimportant, such as video streaming.

###### Segments
A small piece of data. See: #PDU and #encapsulation

#### Layer 3: Network


#### Layer 2: Data Link

#### Layer 1: Physical

### Other terms
##### #PDU
Protocol Data Unit. A phrase in the OSI model that is used to reference the information being sent across a network.
* In layer 1, a PDU is a bit.
* In layer 2, it's a frame
* In layer 3, it's a packet.
* In layer 4, it's a segment.
* In layers 5 and above, it's simply data.

##### #Encapsulation
The process of adding information to data as it traverses the OSI layers. This is turns a segment into a packet, and so on.


### TCP/IP



##### IP

