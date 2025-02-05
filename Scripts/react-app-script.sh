
#!bin/bash
echo "CAUTION THIS SCRIPT ONLY WORKS ON UBUNTU IMAGES"
-------------------------------------------------------------------------------------------------------------------
#This script automates the process of deploying a react application to development server built on an Ec2 instance.
-------------------------------------------------------------------------------------------------------------------

#STEP 1: UPDATE THE LINUX INSTANCE (COULD BE UBUNTU, RHEL, FEDORA OR AMAZON AMI). DEPENDING ON YOUR DISTRIBUTIONS, 
	
	#USE THE APPROPRIATE PACKAGE MANAGER. IN THIS TUTORIAL WE MAKE USE OF THE UBUNTU LINUX AMI THAT USES 'apt'
	echo "UPDATING APT"
	Sudo apt update
	
#STEP 2: INSTALL NODEJS FOR YOUR LINUX OS (CHECKOUT THE AWS OFFICIAL DOCUMENTATION: https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html)
	echo "INSTALLING CURL"
	sudo apt install curl

	# This installs node version manager (nvm).
	echo "INSTALLING NVM"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash 

	# Activate NVM
	
	. ~/.nvm/nvm.sh
	
	#Install node now
	echo "INSTALLING NODE"
	nvm install node 15.14.0
	nvm use 15.14.0
	
	#Confirm version of node (OPTIONAL)
	node -v

#STEP 3: INSTALL NGINX OR APACHE WEBSERVER
	
	#For Nginx: 
	echo "INSTALLING NGINX"
	sudo apt install nginx
	
	#Start the webserver after installation
	sudo systemctl start nginx 
	sudo systemctl enable nginx

#STEP 4: Navigate into the /var/www/ directory
	echo "CHANGING DIRECTORY TO /VAR/WWW/"
	cd /var/www/

	#change directory permissions to grant read,write access to webserver
	echo "CHANGING /HTML DIRECTORY PERMISSION"
	chmod 777 html # NOTE:Best practice is to grant the least priviledge in production environments
	
	echo "CHANGING DIRECTORY TO /VAR/WWW/HTML"
	cd /var/www/html
	
	echo "CLONING CODE REPOSITORY"
	git clone https://github.com/Wastino/Mobalysis.git
	cd /var/www/html/Mobalysis/frontend/

#STEP 5: START APP
	npm install
	npm run build
#STEP6:
	sudo cp -r build/* ../../
	cd ../../
	sudo rm index.nginx-debian.html

#Note: Remember to edit inbound rules in your Ec2 security group to allow SSH, HTTP (port 80), HTTPS (port 443) and Custom TCP (port 300) traffic





