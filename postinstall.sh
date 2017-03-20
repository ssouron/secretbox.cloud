#!/bin/bash

apt -y install git

cd /home/ubuntu

git clone https://github.com/ssouron/secretbox.cloud.git
chown -R ubuntu:ubuntu /home/ubuntu/secretbox.cloud


