#!/bin/bash
sysctl net.ipv4.ip_forward=1
iptables-restore /root/iptables_wifi_12-09-15_13-55 
systemctl stop NetworkManager
kill -9 $(pgrep wpa)
kill -9 $(pgrep dhclient)
ip a add 192.158.1.1/24 dev wlp3s0
hostapd /root/hostapd.conf &
systemctl start httpd
systemctl start dhcpd
cd /var/www/auth_tcc/bin/
./rails server --binding 0.0.0.0 &
