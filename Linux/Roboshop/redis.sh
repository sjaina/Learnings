#!/bin/bash
source common.sh

print "Installing Redis dependency"
yum install epel-release yum-utils http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y &>>$log
 status_check $?


print "install Redis"
yum install redis -y --enablerepo=remi &>>$log
status_check $?

print "updating Config file"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf &>>$log
status_check $?

 print "Start redis"
systemctl enable redis &>>$log &&  systemctl start redis &>>$log
status_check $?