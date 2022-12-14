

#!/usr/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

# IP config for interfaces
sudo cat $config_location/interfaces.txt >> /etc/network/interfaces


sudo apt-get install man ifupdown iptables network-manager dos2unix nftables iptables-persistent apache2 libapache2-mod-wsgi-py3 dhcpcd5 dnsmasq hostapd -y
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

# DHCPCD
# copy the config file to dhcpcd.conf
sudo cat $config_location/dhcpcd_conf.txt >> /etc/dhcpcd.conf
sudo systemctl restart dhcpcd


# DNSMASQ
# copy the config file to dnsmasq.conf
sudo cat $config_location/dnsmasq_conf.txt >> /etc/dnsmasq.conf

sudo systemctl start dnsmasq



# HOSTAPD
# edit the DEAMON parameters
sudo sed -i 's,#DAEMON_CONF="",DAEMON_CONF="/etc/hostapd/hostapd.conf",' /etc/default/hostapd

# copy the config file to hostapd.conf
sudo cat $config_location/hostapd.conf > /etc/hostapd/hostapd.conf
sudo dos2unix /etc/hostapd/hostapd.conf

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd

