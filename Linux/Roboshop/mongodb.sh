#!/bin/bash
source common.sh

print "Creating a repo for Mongodb"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
status_check $?

print "Installing Mongodb"
yum install -y mongodb-org &>>$log
 status_check $?

print "Adding 0.0.0.0 in config file"

sed -i -e '/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$log
status_check $?

print "Enabling and starting MongoDB service"
systemctl enable mongod &>>$log && systemctl start mongod &>>$log
status_check $?

Print "Downloading schema \t"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$log
status_check $?

Print "unzip and loading the schema"
cd /tmp &>>$log && unzip mongodb.zip &>>$log && cd mongodb-main  &>>$log
status_check $?

 #mongo < catalogue.js && mongo < users.js
