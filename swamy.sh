#!/bin/bash

#checking root user or not
userid=$(id -u)
packages=("mysql" "nginx" "python")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
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
echo -e "$2 is $G successfully installed $N"
else
echo -e "$2 installation is $Rfailed $N"
exit 1
fi
}

for package in ${packages[@]}
do
dnf list installed $package
if [ $? -eq 0 ]
then
echo - e "$package is already installed: nothing to do"
else
echo -e "$package is not installed:  $G going to install$N"
dnf install $package -y
validate $? "$package"
fi
done

