#!/bin/bash


#install apache2 and pip
sudo apt install apache2 -y
sudo apt install pip -y
#make a new map named piapp in the /var/www/ directory
cd /var/www
sudo mkdir odroid


#install python-3-venv inside piapp
cd odroid/
sudo apt install python3-venv -y

#make venv directory and install activate_this.py from gitlab
sudo python3 -m venv venv
cd venv/bin
sudo wget https://gitlab.fdmci.hva.nl/fys-cs/2223/ic102/ic102-c/fys.git/InstallationFiles/config/apache/activate_this.py


#make new configuration for the website
cd /etc/apache2/sites-available
sudo wget https://gitlab.fdmci.hva.nl/fys-cs/2223/ic102/ic102-c/fys.git/InstallationFiles/config/apache/odroid.conf


#Install libapache 
sudo apt install libapache2-mod-wsgi-py3 -y

#enable odroid.conf and disable the default config file
sudo a2ensite odroid.conf
sudo a2dissite 000-default.conf
sudo service apache2 restart

#activate virtual environment and install flask
cd /var/www/odroid
. venv/bin/activate
pip install flask

sudo wget 




