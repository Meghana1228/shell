#!/bin/bash

#checking root user or not
userid=$(id -u)
packages=("mysql" "nginx" "python")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
logsfolder="var/log/shellscriptlogs"
scriptname=$(echo $0 | cut -d "." -f1)
logfile=$logsfolder/$scriptname.log"
mkdir -p $logsfolder
if [ $userid -eq 0 ]
then
echo "you are having root access : pls proceed"
else
echo "you are not having root access: exiting"
exit 1
fi
validate(){
    if [ $1 -eq 0 ]
then
echo -e "$2 is $G successfully installed $N" &>>logfile
else
echo -e "$2 installation is $Rfailed $N" &>>logfile
exit 1
fi
}

for package in ${packages[@]}
do
dnf list installed $package &>>logfile
if [ $? -eq 0 ]
then
echo -e "$package is $G already installed: nothing to do $N" &>>logfile
else
echo -e "$package is not installed:  $G going to install$N" &>>logfile
dnf install $package -y &>>logfile
validate $? "$package"
fi
done

