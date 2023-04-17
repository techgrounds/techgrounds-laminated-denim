* Scan the network of your Linux machine using nmap. What do you find?
	* What is the nmap tool and how does it  work?  

To start, I downloaded Nmap onto my Linux VM. I proceeded to skim the manual before asking ChatGPT for a breakdown on its many uses. Following this, I found a source on google that ran me through some commonly used commands and flags.

* Analyse web browser packets in Wireshark.
	* 

[Nmap manual](https://nmap.org/book/man.html)
[Nmap guide](https://www.geeksforgeeks.org/nmap-command-in-linux-with-examples/)


#### Nmap
Network Mapper is open source software that is used to find the hosts and services on a network. It is available on Linux and Windows and can be used to probe networks for vulnerabilities and information about specific devices.

#### Open, filtered, closed, and unfiltered ports
Terms used by Nmap to designate the status of a port. An open port is actively being used by the machine to listen for packets. A filtered port indicates that a firewall or other impediment is stopping Nmap from seeing the status of the port. Closed ports are inactive. Unfiltered ports respond to Nmap, but Nmap is incapable of determing their status as open or closed.





After installing Nmap on my Linux VM, I scanned the subnet I was connected to and found the IP addresses and open ports of the other students' VMs. Furthermore, I discovered that all these ports are unfiltered. I was also able to scan https://www.google.com and discovered that it is open on ports 80 and 443 for tcp traffic via http and https respectively.

