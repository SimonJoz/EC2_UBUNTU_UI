#!/bin/bash

sudo apt update -y

# Install
sudo DEBIAN_FRONTEND=noninteractive apt install ubuntu-desktop -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install xrdp -y

# Installing a desktop environment : XFCE in our case as xRDP has problems working with Unity and GNOME desktop environment.
sudo DEBIAN_FRONTEND=noninteractive apt-get install xfce4 -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install xfce4-terminal -y

# Make xRDP to use the environment we just create
sudo sed -i.bak '/fi/a #xrdp multiple users configuration \n xfce-session \n' /etc/xrdp/startwm.sh

#Provide the Firewall permissions, allowing RDP (running at port 3389) to go through the local firewall.
#sudo ufw allow 3389/tcp


# Restart xRDP
sudo /etc/init.d/xrdp restart

# USER SETUP

## Change to the super user
#sudo su -
#
## Provide a password for the "ubuntu" user
#passwd ubuntu
