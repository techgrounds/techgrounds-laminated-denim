Betekent uncomplicated firewall. Zit standaard in elke Ubuntu distributie. Het is eigenlijk een front-end command line interface dat gebruik maakt van *iptables*, een andere Linux firewall functie.

1. Explain `sudo apt update` and `sudo apt install apache2` and why they're not necessary
2. Launch the webserver with `sudo systemctl start apache2` and `sudo systemctl enable apache2`
3. View `http://18.157.179.30:58009` on chrome, explain this is possible because there is no firewall.
4. Explain port forwarding and that ports are logical not physical.
5. Check ufw status with `sudo ufw status` and next add `sudo ufw allow OpenSSH`; explain why.
6. Enable ufw with `sudo ufw enable`
7. Filter http with `sudo ufw deny http`
8. Check the website via chrome, show it's blocked.