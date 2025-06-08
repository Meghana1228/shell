#!/bin/bash

#checking root user or not
userid=$(id -u)
packages=("mysql" "nginx" "python")
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
echo "$2 is successfully installed"
else
echo "$2 installation is failed"
exit 1
fi
}

for package in ${(packages[@])}
do
dnf list installed $package
if [ $? -eq 0 ]
then
echo "$package is already installed: nothing to do"
else
echo "$package is not installed: going to install"
dnf install $package -y
validate $? "$package"
fi
done

