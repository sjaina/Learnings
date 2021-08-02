#!/bin/bash
source common.sh

print "Installing NodeJS"
yum install nodejs make gcc-c++ -y  &>>$log
status_check $?

print "Add roboshop user"
id roboshop &>>$log
if [ $? -ne 0 ]; then
  useradd roboshop
  fi
status_check $?

print "Downloading Code"
$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$log
status_check $?

print "unzipping the code"
cd /home/roboshop &>>$log && unzip -o /tmp/catalogue.zip &>>$log
status_check $?

print "Renaming the file and moving to catalogue"
mv catalogue-main catalogue &>>$log  && cd /home/roboshop/catalogue &>>$log
status_check $?

print "Installing NPM"
npm install &>>$log
status_check $?


print "Creating catalogue service"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service &>>$log
status_check $?

print "reloading, enabling and starting Catalogue service"
systemctl daemon-reload &>>$log && systemctl start catalogue &>>$log && systemctl enable catalogue &>>$log
status_check $?