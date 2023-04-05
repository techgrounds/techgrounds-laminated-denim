● Start the telnet daemon.
● Find out the PID of the telnet daemon.
● Find out how much memory telnetd is using.
● Stop or kill the telnetd process.


* How to start a process? 
	* How to find a process ID?
		* I used the Linux Fundamentals Course on tryhackme to find the **top** command.
	* How to find the memory usage of a process?
		* I read part of the manual file on **top** and followed this by trying the **-p** flag.
	* How to kill a process?
		* I used the same source as above.

##### apt

##### daemon
A daemon is a background process that runs automatically and does not print information to the console in any way.

##### PID
Process ID. A numerical value assigned to a process.

##### ps
Lists the user's currently running processes. Used with the **aux** flag, it displays all active processes, including system processes and those belonging to other users.

##### top
A command that displays real-time usage statistics on running processes. Includes memory & CPU utilization. Using the **-p** flag `top -p PID` displays detailed information on a process.

##### kill
Kills or ends a process.




https://tryhackme.com/room/linuxfundamentalspart3
https://adamtheautomator.com/linux-to-install-telnet/