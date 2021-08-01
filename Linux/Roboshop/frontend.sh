#!/bin/bash
source common.sh

print "Installing Nginix Server"
yum install nginx -y &>>$log
status_check $?

print "Enabling nginx service\t"
systemctl enable nginx &>>$log
status_check $?

print "Starting ngnix server\t"
systemctl start nginx &>>$log
status_check $?