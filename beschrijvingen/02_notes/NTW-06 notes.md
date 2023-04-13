* Open https://app.diagrams.net/
* Google: subnet calculator
* Create in the above URL:
○ 1 private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet
minimaal 15 hosts kunnen plaatsen.
○ 1 private subnet dat internet toegang heeft via een NAT gateway. Dit subnet
moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT
gateway).
○ 1 public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts
kunnen plaatsen (de 5 hosts is exclusief de internet gateway).


* Public IP: 31.186.200.192/29: 31.186.200.192 - 31.186.200.199
* Private IP with NAT: 192.168.1.0/27 192.168.1.0 - 192.168.1.31
* Private IP without NAT: 192.168.1.32/27 192.168.1.32 - 192.168.1.64
* Private subnet for the web server: 192.168.1.64/29
* 


[AWS explanation on public & private subnets](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html)
[Subnetting and address space tutorial](https://hub.packtpub.com/understanding-address-spaces-and-subnetting-in-ipv4-tutorial/)  
[Subnet calculator](https://www.subnet-calculator.com/)  
[CIDR](https://www.techtarget.com/searchnetworking/definition/CIDR)  
[Network address](https://www.techopedia.com/definition/20969/network-address)  
[Broadcast address](http://ladu.htk.tlu.ee/erika/taavi/doc2/network_and_broadcast_address.html)



#### #Subnets
Subnetting is a manner of dividing an IP address range into distinct networks. For example, one could create multiple subnets from the range 198.168.1.0 to 198.168.1.255. This is done using bits, therefore each subnet range will be some exponent of 2.  
    192.168.1.0 to 192.168.1.31
    192.168.1.32 to 192.168.1.63
The above is an example of an address range being divided into 8 subnets of 32 addresses. These could be smaller or bigger depending on the requirements of the network. Two IP addresses per subnet are always reserved: the first as the network IP, and the last as the broadcast IP.

#### Subnet Masking
A subnet mask is used to designate the IP address range for subnets. It divides an IP address into a a host address and a network address and determines how many devices are allowed on the subnet. The easiest way to visualise this is to set all the network bits to 1 and the host bits to 0. This value will be the subnet mask. For example, `255.255.255.0/24` creates a subnet with 8 free bits to be assigned to hosts. `255.255.255.192/26` creates 4 subnets with 6 free bits for hosts, or 62 hosts per subnet.

#### VLSM
Variable Length Subnet Masking allows for subnets to be divided into smaller subnets. Using the previous example under the subnets header, one could use 7 subnets of 32 addresses and create multiple smaller subnets from the final 32 addresses.

#### CIDR
Classless Inter Domain Routing is a manner of condensing routing tables into a smaller size. Instead of dividing a route into an IP address and a subnet mask, it notes the network address and the number of mask bits. For example, `192.168.1.0 255.255.255.192` becomes `192.168.1.0/26` because there are 6 available bits for use by each subnet.

#### Network address
Network addresses are used to identify the network device on a particular subnet. For example, the switch or router.

#### Broadcast address
Broadcast addresses are used to address all devices on a network at once.



#### NAT Gateway
See [NTW-02](NTW-02_report_devices.md) for gateways and [NTW-05](NTW-05_report_ipaddresses.md) for NAT.
