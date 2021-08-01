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
    echo Fail
  fi
}

#print label
print(){
  echo -n -e "$1\t\t"
}
