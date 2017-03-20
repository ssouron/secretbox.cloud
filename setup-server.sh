#!/bin/bash

# paramétrage de la connexion au vRack

echo > 90-vrack.cfg
for n in 4 5 6 7 8
  echo "auto ens$n" >> 90-vrack.cfg
  echo "iface ens$n inet static" >> 90-vrack.cfg
  echo "    address $IP" >> 90-vrack.cfg
  echo "    netmask 255.255.255.0" >> 90-vrack.cfg
  echo >> 90-vrack.cfg
done

sudo chown root:root 90-vrack.cfg
sudo mv 90-vrack.cfg /etc/network/interfaces.d/




# redémarrage
sudo reboot now

