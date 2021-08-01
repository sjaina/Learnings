#!/bin/bash

log=/tmp/roboshop.log
rm -f $log
status_check()
{
  if [ $1 -eq 0 ]; then
   echo -e "\e[32m Done\e[0m"
  else
    echo Fail
  fi
}

print(){
  echo -n -e "$1\t\t"
}

print "Installing Nginix Server"
yum install nginx -y &>>$log
status_check $?

print "Enabling nginx service\t"
systemctl enable nginx &>>$log
status_check $?

print "Starting ngnix server\t"
systemctl start nginx &>>$log
status_check $?