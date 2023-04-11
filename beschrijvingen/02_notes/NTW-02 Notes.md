Opdracht:
- Benoem en beschrijf de functies van veel voorkomend netwerkapparatuur
- De meeste routers hebben een overzicht van alle verbonden apparaten, vind deze
lijst. Welke andere informatie heeft de router over aangesloten apparatuur?
- Waar staat je DHCP server op jouw netwerk? Wat zijn de configuraties hiervan?

[List of commonly used networking devices.](https://www.geeksforgeeks.org/network-devices-hub-repeater-bridge-switch-router-gateways/)
[Alt. source for networking devices.](https://blog.netwrix.com/2019/01/08/network-devices-explained/)
[Info about networking topologies](https://tryhackme.com/room/introtolan)

* Create a list of common network devices and describe their functions.
	* Search for common network devices.
		* Read articles describing their functions and write notes.  
* Log in on router and find a list of connected devices.
	* Explore the router's menu to find what other information it stores on connected devices.
* What are the DHCP settings on my network?


## Common network devices

### Repeater
A repeater is tasked with copying a weakening signal and retransmitting it at full strength over the same network. It is not an amplifier; it does not increase the strength of the signal. A repeater is a device with two ports and functions on the physical layer.

### Hub
A hub is in essence a repeater with more than two ports. It connects multiple  devices on the same network and retransmits signals it receives to all connected devices. It does not discriminate between devices; meaning data it sends to one device it sends to all. It operates on the physical layer.

### Bridge
A bridge is similar in function a repeater, but is capable of reading the #MAC addresses of the devices on both ends of a signal. They can also be used to connect two LANs that function on the same networking protocols. It is a two port device, and because of its ability to read MAC addresses is a data link layer device.

### Switch
A switch is more complicated and efficient than the devices named above. Unlike a bridge, it has multiple ports and boasts features that improve performance. It is capable of checking packets for errors before forwarding them to the correct destination. Switches exist with many different kinds of functions, including:
* Managed switches, which offer many more configuration options like VLANs. They're ideal for bigger, more complicated networks.
* Smart switches, which feature capabilities not dissimilar to managed switches. Typically they're easier to configure and suited to medium-sized networks.
* Unmanaged switches, which are ideal for small networks.

### Router
A router is primarily a network layer device, and used to connect a LAN (Local Area Network) to a WAN (Wide Area Network), such as the internet. As their name indicates, routers are responsible for routing data via the ideal path.

### Modem

### Gateway

### NIC

## Other terms

#### DHCP
