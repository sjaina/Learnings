#!/bin/bash

log=/tmp/roboshop.log
rm -f $log
echo -n -e "Installing Nginix Server\t ..."
yum install nginx -y &>>$log
if [ $? -eq 0 ]; then
  echo -e "\e[32m Done\e[0m"
else
  echo Fail
  fi
echo -n -e "Enabling nginx service\t\t"
systemctl enable nginx &>>$log
if [ $? -eq 0 ]; then
  echo -e "\e[32m Done\e[0m"
else
  echo Fail
  fi
echo -n -e "Starting ngnix server\t\t"
systemctl start nginx &>>$log
if [ $? -eq 0 ]; then
  echo -e "\e[32m Done\e[0m"
else
  echo Fail
  fi