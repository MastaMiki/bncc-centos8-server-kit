#!/bin/bash
sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "           IP Configulation          "
sudo echo ""
sudo echo "====================================="
sleep 5


sudo nmcli con mod ens33 ipv4.method manual ipv4.address $ens33_ip/$ens33_netmask ipv4.gateway $ens33_gateway
sudo nmcli con mod ens33 ipv6.method ignore
sudo nmcli con mod ens33 ipv4.dns "$ens33_ip 8.8.8.8 131.107.0.1""
sudo nmcli con mod ens33 autoconnect yes
sudo nmcli con down ens33
sudo nmcli con up ens33



sudo nmcli con mod ens34 ipv4.method manual ipv4.address $ens34_ip/$ens34_netmask
sudo nmcli con mod ens34 autoconnect yes
sudo nmcli con down ens34
sudo nmcli con up ens34



sudo nmcli con mod ens35 ipv4.method manual ipv4.address $ens35_ip/$ens35_netmask
sudo nmcli con mod ens35 autoconnect yes
sudo nmcli con down ens35
sudo nmcli con up ens35