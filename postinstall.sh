#!/bin/bash

IP='192.168.0.1'

# installation git et clonage des scripts
apt -y install git
cd /home/ubuntu
git clone https://github.com/ssouron/secretbox.cloud.git
chown -R ubuntu:ubuntu /home/ubuntu/secretbox.cloud

# configuration interface vRack
echo > /etc/network/interfaces.d/99-vRack.cfg
for n in 4 5 6 7 8
do
  echo "auto ens$n" >> /etc/network/interfaces.d/99-vRack.cfg
  echo "iface ens$n inet static" >> /etc/network/interfaces.d/99-vRack.cfg
  echo "    address $IP" >> /etc/network/interfaces.d/99-vRack.cfg
  echo "    netmask 255.255.255.0" >> /etc/network/interfaces.d/99-vRack.cfg
done




# redémarrage
reboot now

