#!/bin/bash

IP='192.168.0.87'

echo > /etc/network/interfaces.d/99-vrack.cfg
for n in 4 5 6 7 8
do
  echo "auto ens$n" >> /etc/network/interfaces.d/99-vrack.cfg
  echo "iface ens$n inet static" >> /etc/network/interfaces.d/99-vrack.cfg
  echo "    address $IP" >> /etc/network/interfaces.d/99-vrack.cfg
  echo "    netmask 255.255.255.0" >> /etc/network/interfaces.d/99-vrack.cfg
  echo >> /etc/network/interfaces.d/99-vrack.cfg
done


