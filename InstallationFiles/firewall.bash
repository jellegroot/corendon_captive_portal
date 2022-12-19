IPTABLES=/sbin/iptables 


#blokkeer inkomend verkeer
$IPTABLES -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j REJECT

#stuur naar captive portal
$IPTABLES -A FORWARD -i eth0 -o wlan0 -m state --state ESTABLISHED, RELATED -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT  --to-destination  127.0.0.1
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to-destination  127.0.0.1
$IPTABLES -t nat -A POSTROUTING -j MASQUERADE


#when logged in give acces to ports using ip-address

$IPTABLES -t nat -A PREROUTING -m mark --mark 99 -p tcp --dport 80 -j DNAT --to-destination 192.168.4.1
$IPTABLES -t filter -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT
$IPTABLES -t filter -A INPUT -p udp --dport 53 -j ACCEPT
$IPTABLES -t filter -A INPUT -m mark --mark 99 -j DROP


$IPTABLES -t nat -A PREROUTING -i wlan0 -p tcp --dport 80 -j DNAT  --to-destination  192.168.4.1:80
$IPTABLES -t nat -A PREROUTING -i wlan0 -p tcp --dport 443 -j DNAT --to-destination  192.168.X.X:443
$IPTABLES -t nat -A POSTROUTING -j MASQUERADE




