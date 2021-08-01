#!/bin/bash
echo "We are installing $0"

Echo "Installing Nginix Server"
yum install nginx -y
echo "Enabling nginx service"
systemctl enable nginx
echo
systemctl start nginx