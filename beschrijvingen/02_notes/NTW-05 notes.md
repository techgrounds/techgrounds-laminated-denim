#### Study:
* IP addresses
* IPv4 and IPv6
* Public and private IPs
* NAT
* Static and dynamic addresses  
I have a layman's knowledge of the above, so to solve the above I need to:
* Find useful, informative sources.
* Transcribe the information into my own words.

#### IP addresses
Internet Protocol addresses are a number that identify a device on a network. In the [32-bit](NTW-04_report_binaryhex.md) IPv4 protocol, hey are typically written in the following format: `255.255.255.255`. In the 128-bit IPv6 protocol, addresses are written using hexadecimal, like so: `2001:0db8:84a3:0000:0000:8a2d:0350:6333`

#### IPv4
Internet Protocol version 4 has been superseded by IPv6, but is still incredibly popular and remains the most widely used protocol. It governs how devices communicate over a network.

#### IPv6
IPv6 is a 128-bit protocol that provides many more addresses. Because of its length, it is possible to leave out repeated 0's in the same octet when writing out an address. Further, an IPv6 address is split into two sections: a network component and a node component. This is done by splitting the address in half. The first 64 bits refer to the network, and the final 64 bits to the node.

The bits used for the network portion of the address are used primarily for routing. It's split further into two blocks: one of 48, used for routing over the internet. The other 16 bits are used for subnetting on LANs. The remaining 64 bits draw information from the #MAC address. 

#### Public and private IPs
Public IPs are used to address an entire local network of devices via the router. It is effectively the IP address with which one is visible on the internet. Private IPs are used to identify devices on the local network.

#### NAT
Network address translation is essentially a means of combining a local network of multiple private IPs into a single public IP. This function is typically found on a router or gateway.

#### Static and dynamic IPs
Dynamic IPs change automatically. On a private network these are assigned by the DHCP server. Publically, it is a user's ISP that designates IP addresses. Static IPs are configured manually. They're particularly useful for servers that need to consistently available on the same address.


#### Exercise:

* Find my PC and mobile's public IP while they're connected to the same network.
	* There are sites that can do this.
		* Are the addresses the same? Why or why not?
			* The knowledge for this answer should be found during study.
* Find my PC and laptop's private IPs.
	* I should be able to find this info on my router.
		* Are the addresses the same? Why or why not?
			* As above, I should find this knowledge during study.
* Change the private IP of my phone to that of my PC and note what happens.
	* I can probably do this on either my router or my phone, and the experimentation should not cost me any extra time compared to searching for the solution.
*  Change the private IP of my phone to a public IP and note what happens.
	* See above.

[Info on IP addresses](https://www.kaspersky.com/resource-center/definitions/what-is-an-ip-address)  
[Info on IPv4](https://www.cloudns.net/blog/what-is-ipv4-everything-you-need-to-know/)  
[Info on IPv6](http://www.steves-internet-guide.com/ipv6-guide/)  
[Info on NAT](https://www.techopedia.com/definition/4028/network-address-translation-nat)
