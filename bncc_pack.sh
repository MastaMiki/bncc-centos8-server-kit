#!/bin/bash

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "          Made by MastaMiki          "
sudo echo ""
sudo echo "====================================="
sudo echo '▒▒▒▒▒▒▒█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█▒▒▒▒▒▒▒▒▒▒'
sudo echo '▒▒▒▒▒▒▒█░▒▒▒▒▒▒▒▓▒▒▓▒▒▒▒▒▒▒░█▒▒▒▒▒▒▒▒'
sudo echo '▒▒▒▒▒▒▒█░▒▒▓▒▒▒▒▒▒▒▒▒▄▄▒▓▒▒░█░▄▄▒▒▒▒▒'
sudo echo '▒▒▄▀▀▄▄█░▒▒▒▒▒▒▓▒▒▒▒█░░▀▄▄▄▄▄▀░░█▒▒▒▒'
sudo echo '▒▒█░░░░█░▒▒▒▒▒▒▒▒▒▒▒█░░░░░░░░░░░█▒▒▒▒'
sudo echo '▒▒▒▀▀▄▄█░▒▒▒▒▓▒▒▒▓▒█░░░█▒░░░░█▒░░█▒▒▒'
sudo echo '▒▒▒▒▒▒▒█░▒▓▒▒▒▒▓▒▒▒█░░░░░░░▀░░░░░█▒▒▒'
sudo echo '▒▒▒▒▒▄▄█░▒▒▒▓▒▒▒▒▒▒▒█░░█▄▄█▄▄█░░█▒▒▒▒'
sudo echo '▒▒▒▒█░░░█▄▄▄▄▄▄▄▄▄▄█░█▄▄▄▄▄▄▄▄▄█▒▒▒▒▒'
sudo echo '▒▒▒▒█▄▄█░░█▄▄█░░░░░░█▄▄█░░█▄▄█▒▒▒▒▒▒▒'
sleep 5
source config.sh
. ipconfig.sh
. test.sh
if rpm -q mariadb-server
then
    pwd
else
    . mariadb.sh
fi
sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "          Main Installation          "
sudo echo "                 1/7                 "
sudo echo ""
sudo echo "====================================="
sleep 5

 sudo yum -y install httpd dhcp-server vsftpd bind bind-utils php php-mysqlnd php-json wget

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "          vsftpd Installation        "
sudo echo "                 2/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

 sudo systemctl enable --now vsftpd

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "     vsftpd Installation Complete    "
sudo echo "                 2/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1
sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "          bind Installation          "
sudo echo "                 3/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

 sudo cp named/named.conf /etc/named.conf
 sudo cp named/forward.bncc.lab /var/named/forward.bncc.lab
 sudo cp named/reverse.bncc.lab /var/named/reverse.bncc.lab
 sudo chgrp named -R /var/named
 sudo chown -v root:named /etc/named.conf
 sudo restorecon -rv /var/named
 sudo restorecon /etc/named.conf
 sudo systemctl enable --now named
 sudo firewall-cmd --permanent --add-port=53/tcp
 sudo firewall-cmd --permanent --add-port=53/udp
 sudo firewall-cmd --permanent --add-service=http
 sudo firewall-cmd --permanent --add-service=https
 sudo firewall-cmd --reload
 sudo systemctl restart named

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "       bind Installation Complete    "
sudo echo "                 3/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "          httpd Installation         "
sudo echo "                 4/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

 sudo cp httpd/httpd.conf /etc/httpd/conf/httpd.conf
 sudo systemctl enable --now httpd
 sudo systemctl restart httpd

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "      httpd Installation Complete    "
sudo echo "                 4/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "          dhcp Installation          "
sudo echo "                 5/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

 sudo cp dhcp-server/dhcpd.conf /etc/dhcp/dhcpd.conf
 sudo systemctl enable --now dhcpd
 sudo systemctl restart dhcp

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "      dhcp Installation Complete     "
sudo echo "                 5/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "        phpMyAdmin Installation      "
sudo echo "                 6/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1

sudo rm -rf phpMyAdmin-5.0.2-all-languages
sudo tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
sudo mv phpMyAdmin-5.0.2-all-languages /usr/share/phpMyAdmin
sudo mkdir /usr/share/phpMyAdmin/tmp
sudo chmod 777 /usr/share/phpMyAdmin/tmp
sudo cp phpMyAdmin/config.inc.php /usr/share/phpMyAdmin/
sudo cp phpMyAdmin/phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf
sudo mysql < /usr/share/phpMyAdmin/sql/create_tables.sql -u root -p
sudo systemctl restart httpd

sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "   phpMyAdmin Installation Complete  "
sudo echo "                 6/7                 "
sudo echo ""
sudo echo "====================================="
sleep 1
sudo echo "====================================="
sudo echo ""
sudo echo "          BNCC Centos 8 Pack         "
sudo echo "         Installation Complete       "
sudo echo "                 7/7                 "
sudo echo "           let's go config           "
sudo echo ""
sudo echo "====================================="
sudo echo '▒▒▒▒▒▒▒█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█▒▒▒▒▒▒▒▒▒▒'
sudo echo '▒▒▒▒▒▒▒█░▒▒▒▒▒▒▒▓▒▒▓▒▒▒▒▒▒▒░█▒▒▒▒▒▒▒▒'
sudo echo '▒▒▒▒▒▒▒█░▒▒▓▒▒▒▒▒▒▒▒▒▄▄▒▓▒▒░█░▄▄▒▒▒▒▒'
sudo echo '▒▒▄▀▀▄▄█░▒▒▒▒▒▒▓▒▒▒▒█░░▀▄▄▄▄▄▀░░█▒▒▒▒'
sudo echo '▒▒█░░░░█░▒▒▒▒▒▒▒▒▒▒▒█░░░░░░░░░░░█▒▒▒▒'
sudo echo '▒▒▒▀▀▄▄█░▒▒▒▒▓▒▒▒▓▒█░░░█▒░░░░█▒░░█▒▒▒'
sudo echo '▒▒▒▒▒▒▒█░▒▓▒▒▒▒▓▒▒▒█░░░░░░░▀░░░░░█▒▒▒'
sudo echo '▒▒▒▒▒▄▄█░▒▒▒▓▒▒▒▒▒▒▒█░░█▄▄█▄▄█░░█▒▒▒▒'
sudo echo '▒▒▒▒█░░░█▄▄▄▄▄▄▄▄▄▄█░█▄▄▄▄▄▄▄▄▄█▒▒▒▒▒'
sudo echo '▒▒▒▒█▄▄█░░█▄▄█░░░░░░█▄▄█░░█▄▄█▒▒▒▒▒▒▒'