#bin/bash!

iInf=$1
wInf=$2

COMMAND='which 0'
DIR=dirname $COMMAND"/../wifi"

echo "Preparation interface connectivity: $iInf"
echo "Enable interface: $wInf"
sed -i "Insert configuration interface $wInf/0" ${DIR}/hostapd.conf
echo "Configuration hostapd..."
service Network-Manager stop
echo "Stopping service Network-Manager..."
ifconfig $wInf down
echo "Down physical interface... "
#echo "Starting hostapd..."
#hostapd -B ${DIR}./hostapd.conf
echo "Configuring wireless interface..."
ifconfig $wInf 10.0.0.1 netmask 255.255.255.0
echo "Starting dnsmasq and DHCP service..."
dnsmasq --no-host --interfaces $wInf --except-interface=lo --listen-address=10.0.0.1 --dhcp-range=10.0.
0.2-10.0.0.10,60m  --dhcp-options=options:router,10.0.0.1 --dhcp-lease-max=23 --pid-file=/var/run/nm-dnsmasq-wlan.pid
echo "Flushing iptables entry..."
iptables -F
iptable -t nat F
echo "Changing Interfaces..." 
echo "Enable NAT..."
iptables -t nat -A POSTROUTING -o $iInf -j MASQUERADE
echo "Loading ip forwarding..."
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Wireless gateway setup complete"
echo "Configuring port forwarding from port 80 and 443 to 8080"
iptables -t nat -A POSTROUTING -l  $wInf -p tcp -dport 80 -j REDIRECT  --to-port 8080
iptables -t nat -A POSTROUTING -l  $wInf -p tcp -dport 443 -j REDIRECT  --to-port 8080
iptables -T nat -A POSTROUTING -s 192.168.17.0/24 -p udp -j MASQUERADE	
#iptables -L -v -n -t nat
echo "Done"
echo ""
echo "Press enter to quit: kill hostpd and dnsmasq"
read quit
echo "Stopping dnsmasq and hostpd..."
kill -9 "pidof dnsmasq"
echo ""
echo "Flushing iptableds entry..."
iptables -F
iptables -F -t nat
echo "Disable ip forwarding..."
echo "Start Network-Manager service"
service ìNetwork-Mnager start
echo 1 > /proc/sys/net/ipv4/ip_forward
echo "Bye"

#Commenti
#hostapd.conf file content
#interfaces=wlan2
#driver=nl80211
#ssid=asd
#hw_mode=g
#channel=6
#
