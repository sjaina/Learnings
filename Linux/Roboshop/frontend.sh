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

print "Update config file"
sed -i -e "/catalogue/ s/localhost/catalogue.roboshop.internal/" -e "/user s/localhost/user.roboshop.internal/" -e "/cart s/localhost/cart.roboshop.internal/" -e "/shipping s/localhost/shipping.roboshop.internal/"  -e "/payment s/localhost/payment.roboshop.internal/" /etc/nginx/default.d/roboshop.conf
status_check $?

# systemctl restart nginx
print "Enabling nginx service\t"
systemctl enable nginx &>>$log
status_check $?

print "Starting ngnix server\t"
systemctl restart nginx &>>$log
status_check $?