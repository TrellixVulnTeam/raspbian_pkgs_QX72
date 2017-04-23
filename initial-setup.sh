#!/usr/bin/env bash

# check if we are root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# update
apt-get update
apt-get -y upgrade

# programming
apt-get -y install cmake pkg-config build-essential git libpcap

# admin
apt-get -y install nmap htop samba samba-common-bin arp-scan

# linux kernel
apt-get -y install raspi-config rpi-update

# ascii art
apt-get -y install jp2a

# install node.js
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs

echo ""
echo "============================="
echo "| Done !!! :)               |"
echo "============================="
echo ""
