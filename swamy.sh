#!/bin/bash

#checking root user or not
userid=$(id -u)
if [ $userid -eq 0 ]
then
echo "you are having root access : pls proceed"
else
echo "you are not having root access: exiting"
exit 1
fi

#installing the mysql
dnf list installed mysql
if [ $? -eq 0 ]
then
echo "mysql is already installed: nothing to do"
else
echo "mysql is not installed: going to install"
dnf install mysql -y
if [ $? -eq 0 ]
then
echo "mysql is successfully installed"
else
echo "mysql is installation is failed"
exit 1
fi
fi
# installing nginx
dnf list installed nginx
if [ $? -eq 0 ]
then
echo " is already installed: nothing to do"
else
echo "nginx is not installed: going to install"
dnf install nginx -y
if [ $? -eq 0 ]
then
echo "nginx is successfully installed"
else
echo "nginx is installation is failed"
exit 1
fi
fi
