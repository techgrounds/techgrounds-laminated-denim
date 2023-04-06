* Allemaal sterretjes om cron iets iedere minuut te laten draaien.
*echo $(date +"%D %T") > $HOME/datetime.txt
* crontab commands kijken niet naar $PATH, note entire path

https://tryhackme.com/room/linuxfundamentalspart3  
https://crontab.guru/  
https://www.howtogeek.com/410442/how-to-display-the-date-and-time-in-the-linux-terminal-and-use-it-in-bash-scripts/  
https://www.cyberciti.biz/tips/shell-script-to-watch-the-disk-space.html  
https://www.techtarget.com/searchdatacenter/definition/crontab


# Exercise:
● Create a Bash script that writes the current date and time to a file in your home
directory.
● Register the script in your crontab so that it runs every minute.
● Create a script that writes available disk space to a log file in ‘/var/logs’. Use a cron
job so that it runs weekly.

* What is the function to print the current date and time?
* How do I register a script in crontab?
	* How do I make it run every minute?
* What is the function to display currently available disk space?
	* How do I make it run weekly?
I solved my issues by first googling the commands or syntax I didn't recognise. I then wrote the required scripts and edited my crontab.

##### cron
Cron is a *daemon* used to schedule tasks to be executed at a specific time and date.

##### crontab
Crontab is a command used to create a table of commands, that the *cron* daemon uses to execute these commands at a specific time.