#!/bin/bash
sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "         MariaDB Installation        "
sudo echo ""
sudo echo "====================================="
sleep 5

sudo yum -y install mariadb-server
sudo systemctl enable --now mariadb
sudo mysql_secure_installation

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "     MariaDB Installation Complete   "
sudo echo ""
sudo echo "====================================="
sleep 1