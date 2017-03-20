#!/bin/bash

# paramétrage de la connexion au vRack

echo
read -p "Adresse IP de la connexion vRack : " IP

echo > 90-vrack.cfg
for n in 4 5 6 7 8
do
  echo "auto ens$n" >> 90-vrack.cfg
  echo "iface ens$n inet static" >> 90-vrack.cfg
  echo "    address $IP" >> 90-vrack.cfg
  echo "    netmask 255.255.255.0" >> 90-vrack.cfg
  echo >> 90-vrack.cfg
done

sudo chown root:root 90-vrack.cfg
sudo mv 90-vrack.cfg /etc/network/interfaces.d/


# création de l'utilisateur stef
sudo useradd -m -U -s /bin/bash stef
sudo adduser stef sudo
sudo cp -r /home/ubuntu/secretbox.cloud /home/stef/secretbox.cloud
sudo chown -R stef:stef /home/stef/secretbox.cloud
echo "stef ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/99-secretbox-users


# redémarrage
sudo reboot now

