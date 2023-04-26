.
# Logging in Windows Powershell SSH
* Ran into a permission denied: public key issue. Solved via comprehensive googling and some mucking about in file permissions.
* Ran into an issue with connecting to the right port number via OpenSSH. Solved via google & with help from a teammate.

 ssh -i $path "C:\Users\Roan\.ssh\Nest-Ro-de-Jong.pem" -p 52209 roan@18.157.179.30

* https://superuser.com/questions/1296024/windows-ssh-permissions-for-private-key-are-too-open
* 