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
  echo "########################\t$1\t########################"
  echo -n -e "$1\t\t"
}


