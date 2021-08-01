#!/bin/bash
source common.sh

print "Installing Nginix Server"
yum install nginx -y &>>$log
status_check $?

print "Downloading Frontend code"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>>$log
status_check $?


print "Removing old docs"
cd /usr/share/nginx/html &>>log && rm -rf * &>>$log
status_check $?

print "Unzipping the code"
unzip /tmp/frontend.zip &>>$log && mv frontend-main/* . &>>$log && mv static/* . &>>$log && rm -rf frontend-master static &>>$log
status_check $?

print "moving roboshop config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>>$log
status_check $?


# systemctl restart nginx
print "Enabling nginx service\t"
systemctl enable nginx &>>$log
status_check $?

print "Starting ngnix server\t"
systemctl start nginx &>>$log
status_check $?