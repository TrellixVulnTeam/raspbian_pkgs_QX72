#!/usr/bin/env bash

# check if we are root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo ""
echo "============================="
echo "| Let's update some pkgs    |"
echo "============================="
echo ""

# update
apt-get update
apt-get -y upgrade

# programming
apt-get -y install cmake pkg-config build-essential git libpcap0.8-dev

# admin
apt-get -y install nmap htop samba samba-common-bin arp-scan wget curl

# linux kernel
apt-get -y install raspi-config rpi-update

# ascii art
apt-get -y install jp2a

# install node.js
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt-get install -y nodejs
npm install -g httpserver

echo ""
echo "============================="
echo "| Let's grab some repos     |"
echo "============================="
echo ""

# packagecloud.io
cd /tmp
curl -s https://packagecloud.io/install/repositories/walchko/robots/script.deb.sh | sudo bash
apt-get update

# install some repos
su pi -c "cd /home/pi/github && git clone git@github.com:walchko/dotfiles.git"

echo ""
echo "============================="
echo "| Go python                 |"
echo "============================="
echo ""

apt-get -y install python-dev
cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py
pip install -U pip setuptools wheel

apt-get -y install python3k
pip3 install -U pip setuptools wheel

echo ""
echo "============================="
echo "| Clean up and fix perms    |"
echo "============================="
echo ""

chown -R pi:pi /home/pi
chown -R pi:pi /usr/local
chown -R pi:pi /usr/lib/python2.7/dist-packages/
chown -R pi:pi /usr/lib/node_modules/

echo ""
echo "============================="
echo "| Done !!! :)               |"
echo "============================="
echo ""
