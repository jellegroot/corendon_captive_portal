import os

ip = input('IP: ')
command = os.system('sudo iptables -I FORWARD -s ' + ip + '-j ACCEPT')
print(command)