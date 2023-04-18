* Scan the network of your Linux machine using nmap. What do you find?
	* What is the nmap tool and how does it  work?  

To start, I downloaded Nmap onto my Linux VM. I proceeded to skim the manual before asking ChatGPT for a breakdown on its many uses. Following this, I found a source on google that ran me through some commonly used commands and flags.

* Analyse web browser packets in Wireshark.
	* What are the packets sent to and from a website when it's opened?
	* How do I filter for these packets in Wireshark?

I recorded a short snapshot of me opening Github in Chrome and looked up which protocols and packets are sent when querying a website. I found the IP for Github, and using an IP address filter found the packets being transmitted.

[Nmap manual](https://nmap.org/book/man.html)
[Nmap guide](https://www.geeksforgeeks.org/nmap-command-in-linux-with-examples/)
[Wireshark documentation](https://www.wireshark.org/docs/wsug_html/)
[Observing TCP in Wireshark](https://www.youtube.com/watch?v=3Zb_EebU22o)

#### Wireshark
See [NTW-03](../../02_Networking_1/02_completed_assignments/NTW-03_report_protocols.md).

#### Nmap
Network Mapper is open source software that is used to find the hosts and services on a network. It is available on Linux and Windows and can be used to probe networks for vulnerabilities and information about specific devices.

#### Open, filtered, closed, and unfiltered ports
Terms used by Nmap to designate the status of a port. An open port is actively being used by the machine to listen for packets. A filtered port indicates that a firewall or other impediment is stopping Nmap from seeing the status of the port. Closed ports are inactive. Unfiltered ports respond to Nmap, but Nmap is incapable of determing their status as open or closed.

After installing Nmap on my Linux VM, I scanned the subnet I was connected to and found the IP addresses and open ports of the other students' VMs. Furthermore, I discovered that all these ports are unfiltered. I was also able to scan https://www.google.com and discovered that it is open on ports 80 and 443 for tcp traffic via http and https respectively.

