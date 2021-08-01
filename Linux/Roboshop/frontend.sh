#!/bin/bash

echo -e "Installing Nginix Server\t\t ... \e[32mDone\e[0m"
yum install nginx -y
echo "Enabling nginx service"
systemctl enable nginx
echo
systemctl start nginx