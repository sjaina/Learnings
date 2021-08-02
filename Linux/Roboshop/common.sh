user_ID=$(id -u)
 if [ $user_ID -ne 0 ]; then
   echo -e "\e[31m You should be root user to run the commands\e[0m"
   exit 2
   fi

#setting up loging file
log=/tmp/roboshop.log

#Removing log file if already exsits
rm -f $log

#checking status
status_check()
{
  if [ $1 -eq 0 ]; then
   echo -e "\e[32m Done\e[0m"
  else
    echo -e "\e[31m Fail\e[0m"
    exit 1
  fi
}

#print label
print(){
  echo "########################$1\########################" &>>$log
  echo -n -e "$1\t\t"
}


nodejs()
{
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
curl -s -L -o /tmp/${component}.zip "https://github.com/roboshop-devops-project/${component}/archive/main.zip" &>>$log
status_check $?

print "unzipping the code"
cd /home/roboshop &>>$log && unzip -o /tmp/${component}.zip &>>$log
status_check $?

print "Renaming the file and moving to ${component}"
rm -rf ${component} &>>$log && mv ${component}-main ${component} &>>$log  && cd /home/roboshop/${component} &>>$log
status_check $?

print "Installing NPM"
npm install --unsafe-perm &>>$log
status_check $?

print "Fixing app permissions"
chown roboshop:roboshop /home/roboshop -R &>>$log
status_check $?


print "setup systemd"
sed -i -e "s/MONGO_DNSNAME/mongodb.roboshop.internal/"  -e "s/MONGO_ENDPOINT/mongodb.roboshop.internal/" -e "s/REDIS_ENDPOINT/redis.roboshop.internal/" -e "s/CATALOGUE_ENDPOINT/catalogue.roboshop.internal/" /home/roboshop/${component}/systemd.service  && mv /home/roboshop/${component}/systemd.service /etc/systemd/system/${component}.service
status_check $?


print "reloading, enabling and starting ${component} service"
systemctl daemon-reload &>>$log && systemctl start ${component} &>>$log && systemctl enable ${component} &>>$log
status_check $?
}

