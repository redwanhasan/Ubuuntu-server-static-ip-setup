#Setting a Static IP Address on Ubuntu Server 22.04
#Ubuntu Server 22.04 uses a utility called ‘netplan’ for networking. To set a static IP we need to edit the config file.

#In the terminal, go to the netplan config file location:
cd /etc/netplan/

#The file should be called 00-installer-config.yaml. To edit it we need to run nano as root so we can make changes to it.
sudo nano /etc/netplan/00-installer-config.yaml

network:
  renderer: networkd
  ethernets:
    eth0:
      addresses:
        - 192.168.10.5/24
      nameservers:
        addresses: [1.1.1.1,8.8.8.8]
      routes:
        - to: default
          via: 192.168.1.1
  version: 2


#   eth0: is the name of my network interface - yours may differ.
#   Under addresses: is the static IP to set, you’ll need to use CIDR notation, so /24 is 255.255.255.0.
#   DNS servers are configured under nameservers: multiple servers should be command separated.
#   The default gateway is set under routes: and - to: default.


#To apply the changes run the following command:
sudo netplan apply

#To confirm the settings, run the following to see the current IP:
ip addr show eth0

#run the following to see the default gateway:
ip route show

