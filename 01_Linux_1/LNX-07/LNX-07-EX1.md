	#! /usr/bin/bash
		
	sudo apt install apache2
	sudo systemctl start apache2
	sudo systemctl enable apache2
	ps -aux | grep apache2

