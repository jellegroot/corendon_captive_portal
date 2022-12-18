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






echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -A FORWARD -i eth0 -o wlan0 -m state --state ESTABLISHED, RELATED -j ACCEPT

$IPTABLES -A FORWARD -m mark --mark 99 -j REJECT
$IPTABLES -A FORWARD -i wlan0 -o eth0 -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE


