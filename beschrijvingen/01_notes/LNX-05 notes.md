Create a text file.
● Make a long listing to view the file’s permissions. Who is the file’s owner and group?
What kind of permissions does the file have?
● Make the file executable by adding the execute permission (x).
● Remove the read and write permissions (rw) from the file for the group and everyone
else, but not for the owner. Can you still read it?
● Change the owner of the file to a different user. If everything went well, you shouldn’t
be able to read the file unless you assume root privileges with ‘sudo’.
● Change the group ownership of the file to a different group.

##### rwx
Read, write, execute. A user with **rwr** permissions for a file can read, write and execute (run) it.

##### -l
An option for the **ls** command. It displays information in a long list format, showing much more detail.

##### chmod
Change mode. This command changes the file permissions for a file using octal values.

##### Octal number system
A numeral system, used in this context to set file permissions. Supplanted in most modern computing by the hexadecimal system.

Read is defined by the number 4. Write by 2. Execute 1. Added together (as 4, 6 or 7) in a 3 digit number signifies which user has permissions. The first digit represents the owner, the second the owner group, and the third other users. An example below:
	chmod 700 LNX-05.txt
changes the permissions for the file LNX-05.txt so that the owner can read, write and execute. Other users and the owner group have no permissions.

##### chown
Changes the owner of a file.

##### chgrp
Changes the group owner of a file.



https://www.hackerearth.com/practice/notes/Virendra/linux-commands-using-chmod/#:~:text=rwx%20means%20that%20this%20user,but%20cannot%20write%20to%20it.  
https://www.redhat.com/sysadmin/linux-file-permissions-explained
