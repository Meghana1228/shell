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