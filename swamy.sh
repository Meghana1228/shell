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
# installing python3
dnf list installed python3
if [ $? -eq 0 ]
then
echo "python3 is already installed: nothing to do"
else
echo "python3 is not installed: going to install"
dnf install python3 -y
if [ $? -eq 0 ]
then
echo "python3 is successfully installed"
else
echo "python3 is installation is failed"
exit 1
fi
fi
