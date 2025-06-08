#!/bin/bash
# check root access of the user
userid=$(id -u)
if [ $userid -eq 0 ]
then 
echo " you are running with root access"
else 
echo " you are not running with root access"
exit 1
fi

# check already installed or not

dnf list installed mysql 
if [ $? -eq 0 ]
then
echo " mysql is already installed "
exit 1
else
echo " mysql is not installed so installing it"
fi
