#!/bin/sh -e

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

echo "Installing dependencies..."
apt-get --yes --force-yes install hostapd dnsmasq

#stop the daemons
sudo systemctl stop dnsmasq
sudo systemctl stop hostapd

echo "Configuring components..."
cp -f hostapd.conf /etc/hostapd/
cp -f dnsmasq.conf /etc/
cp -f dhcpcd.conf /etc/
cp -f rc.local /etc/

echo "Non-rogue captive portal installed. Reboot to execute."
exit 0
