#!/bin/bash
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