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

#$ curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
#$ cd /home/roboshop
#$ unzip /tmp/catalogue.zip
#$ mv catalogue-main catalogue
#$ cd /home/roboshop/catalogue
#$ npm install


# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue