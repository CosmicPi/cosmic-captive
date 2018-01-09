#!/bin/sh -e

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

echo "Installing dependencies..."
apt-get --yes install hostapd dnsmasq

#stop the daemons
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

echo "Configuring components..."
#mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.orig
cp -f hostapd /etc/default/hostapd
cp -f hostapd.conf /etc/hostapd/
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
cp -f dnsmasq.conf /etc/
cp -f dhcpcd.conf /etc/dhcpcd.conf
#cp -f rc.local /etc/
sudo systemctl enable hostapd   
sudo systemctl enable dnsmasq   

echo "Non-rogue captive portal installed. Reboot to execute."
exit 0
