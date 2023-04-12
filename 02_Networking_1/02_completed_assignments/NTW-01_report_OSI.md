#Networking #OSI #TCP/IP

# OSI Stack
OSI and TCP/IP are theoretical models that go into depth to explain how computer networking works. Their primary function in practice is to assist in troubleshooting.

## Key-terms
## OSI model
The Open Systems Interconnection Model. Developed by the International Organization for Standardization, it is is a theoretical model that explains how data flows from a program on one computer to another. It consists of seven layers, each of which has a different duty. Being that it is entirely conceptual, its primary use is to guide troubleshooting and to foster understanding of the mechanisms that underpin computer networking.

### Layers
The OSI model's layers can be split into two sections: upper layers and lower layers. Layers 4-7 are software related. Layers 1-3 handle the transportation of data from one machine to another. When sending data, these layers work top-to-bottom; when receiving data, vice versa.

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

##### #TCP
The Transmission Control Protocol allows for communication over the internet. It's designed to create a connection that lasts until all data has been transmitted. Furthermore, the protocol safeguards against data corruption by checking for errors. It is commonly used for browsing the internet and file sharing, due to its accurate nature.

##### #UDP
The User Datagram Protocol is designed for a faster transfer of data. By not synchronising the connection between two devices or checking the received data for errors, it trades accuracy for efficiency. This is useful for activities that require large amounts of data to be sent where some corruption is unimportant, such as video streaming.

###### Segments
A small piece of data. See: #PDU and #encapsulation

#### Layer 3: Network
The network layer is responsible for routing PDUs from one location to another. It assigns source and destination addresses via the internet protocol (IP) and figures out what the quickest path from one device to another is. Routers are an example of a layer 3 device.

##### IPv4
Internet Protocol version 4. Superseded by IPv6, but still extremely popular. It provides a logical connection between devices on a network by assigning an identity to each device (an #IP address.)

##### RIP
Routing Information Protocol is used to determine the best route for end-to-end traffic. With a metric/hop count algorithm it determines the shortest possible path, which allows data to be delivered as quickly as possible.

#### Layer 2: Data Link
The data link layer is responsible for the physical addressing of a connection. It takes the #PDU it receives from an adjoining layer and adds a MAC address. Furthermore, this layer is responsible for turning packets into frames that are ready for transfer over the network.

##### #MAC
Media Access Control. A MAC address is designated by the manufacturer of a piece of hardware. They are immutable, unique and are the physical addresses that determine where data is sent.

##### ARP
The Address Resolution Protocol translates network layer addresses (such as an IP address) into link layer addresses (such as a MAC address.)

#### Layer 1: Physical
The physical layer is the real-world layer. Using physical hardware it sends electrical signals in binary bits from one device to another. This can be done with a wired or wireless connection.

##### Bluetooth
Bluetooth is a wireless communication protocol used over short distances. Used on a variety of devices, including laptops, phones and wireless earbuds.

##### PON
A passive optical network is a wired connection consisting of optical fibers and splitters that connects multiple points. Examples include fiber-to-the-curb (FTTC)  and fiber-to-the-home (FTTH.) This infrastructure is known as passive because it uses no power once installed. 

## TCP/IP
The TCP/IP model predates the OSI model. It is made up of four layers: the application layer, transport layer, network layer, and the link layer. The transport and network layers are functionally equivalent to their OSI model counterparts. The application layer folds in many of the functions otherwise seen in OSI's presentation and session layer. The link layer combines the physical and data link tasks seen in OSI. Built on the protocols that are the foundation of the internet, it can be considered more practical than the OSI model.

### Link Layer
The link layer in the TCP/IP model is responsible for transmitting data between devices. It is responsible for actions such as addressing and error detection. Commonly used protocols include ethernet, Wi-Fi and Bluetooth.

### Network Layer
The network layer is also called the internet layer. It handles routing, ensuring that data is sent to the correction location via the shortest path. The IP protocol is one of the most widely used protocols in the network layer.

### Transport Layer
The transport layer establishes a connection between two devices and ensures for a reliable, error-free data transmission. Common protocols include #TCP and #UDP.

### Application Layer
The application layer is the topmost layer in the TCP/IP model and the interface between the user and the network. It services applications by handling protocols such as HTTP, FTP and Telnet. In contrast to the OSI model, the TCP/IP model does not include the session and presentation layers. Instead, it considers these to be the responsibility of #API's.

## Other terms
##### #PDU
Protocol Data Unit. A phrase in the OSI model that is used to reference the information being sent across a network.
* In layer 1, a PDU is a bit.
* In layer 2, it's a frame
* In layer 3, it's a packet.
* In layer 4, it's a segment.
* In layers 5 and above, it's simply referred to as data.

##### #Encapsulation
The process of adding information to data as it traverses the OSI layers. This is turns a segment into a packet, and so on.

#### #API
Application programming interfaces are a group of routines, protocols, functions and commands that can be referenced by programmers across different programs. This allows for cross-functionality without requiring massive amounts of new code. For example, a videogame using an API to access functionality that comes with a GPU driver.

## Opdracht
### Gebruikte bronnen
[Description of the OSI model with practical examples.](https://tryhackme.com/room/osimodelzi)  
[An alternative source for the OSI model.](https://www.javatpoint.com/osi-model)  
[Description of the TCP/IP model.](https://www.techopedia.com/definition/2460/transmission-control-protocolinternet-protocol-tcpip)  
[An alternative source for the TCP/IP model](https://www.javatpoint.com/computer-network-tcp-ip-model)  
[OSI layer protocols.](https://www.techopedia.com/definition/24961/osi-protocols)  
[Differences between OSI and TCP/IP](https://www.tutorialspoint.com/OSI-vs-TCP-IP-Reference-Mode)  
[SAP](https://www.techopedia.com/definition/25846/session-announcement-protocol-sap)  
[L2TP](https://www.techtarget.com/searchnetworking/definition/Layer-Two-Tunneling-Protocol-L2TP)  
[PDU](https://www.techopedia.com/definition/25292/protocol-data-unit-pdu)  
[IPv4](https://www.techopedia.com/definition/5367/internet-protocol-version-4-ipv4)  
[RIP](https://www.techopedia.com/definition/24846/routing-information-protocol-rip)  
[ARP](https://www.techopedia.com/definition/5493/address-resolution-protocol-arp)  
[PON](https://www.techopedia.com/definition/16009/passive-optical-network-pon)  
[Bluetooth](https://www.techopedia.com/definition/26198/bluetooth)  
[API](https://www.techopedia.com/definition/24407/application-programming-interface-api))  

### Ervaren problemen
Study the OSI model and its uses.
* What is the OSI model?
	* Solve this by working top to bottom. Read and take notes from two sources per topic/layer.
* What is the OSI model used for?
	* Search for practical examples.

The TCP/IP model and its uses.
* What is the TCP/IP model?
	* Search for the TCP/IP model and explain the differences between it and the OSI model.
* What is the TCP/IP model used for?
	* Search for practical examples.

### Resultaat
By building comprehension of the two models and the most commonly used protocols in each, one is able to more effectively troubleshoot practical problems in the future. This knowledge will also provide the foundation and context necessary for further learning on the subject of networking.
