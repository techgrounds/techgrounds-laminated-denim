● Create a new user in your VM.
○ The new user should be part of an admin group.
○ The new user should have a password.
○ The new user should be able to use ‘sudo’
● Locate the files that store users, passwords, and groups. See if you can find your
newly created user’s data in there.

##### sudo
Super User Do. Allows the user to execute commands they would not normally be able to. Example: `sudo adduser user2`

##### adduser
The command to create a new user. Requires admin (or sudo) permissions.

##### usermod
The command to add a user to a group.

##### su
Switch user. Switches to another user. Will prompt for a password if there is one.

##### -a
Append. In the context of this assignment, it adds the user to the groups listed by **-G** without removing them from other groups.

##### -G


https://www.javatpoint.com/linux-add-user-to-group
https://www.digitalocean.com/community/tutorials/how-to-create-a-new-sudo-enabled-user-on-ubuntu-22-04-quickstart  
https://phoenixnap.com/kb/how-to-list-users-linux#:~:text=Linux%20stores%20information%20about%20local,directory%2C%20and%20the%20login%20shell.  
https://www.ibm.com/docs/en/ibm-mq/9.1?topic=windows-creating-managing-groups-linux  
https://linuxize.com/post/how-to-add-user-to-group-in-linux/