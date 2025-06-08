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

validate (){
    if [ $1 -eq 0 ]
then
echo " $2 is successfully installed "
else
echo " $2 installaition is going to install"
exit 1
fi
}

dnf list installed mysql 
if [ $? -eq 0 ]
then
echo " mysql is already installed "
else
echo " mysql is going to install"
dnf install mysql -y
validate $? "mysql"
fi

