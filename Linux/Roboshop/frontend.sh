#!/bin/bash

log=/tmp/roboshop.log
rm -f $log
echo -n -e "Installing Nginix Server\t\t ..."
yum install nginx -y &>>$log
if($? -eq 0); then echo -e "\e[32m Done\e[0m"
else
  echo Fail
  fi
echo "Enabling nginx service\t"
systemctl enable nginx &>>$log
if($? -eq 0); then echo -e "\e[32m Done\e[0m"
else
  echo Fail
  fi
echo "Starting ngnix server\t"
systemctl start nginx &>>$log
if($? -eq 0); then echo -e "\e[32m Done\e[0m"
else
  echo Fail
  fi