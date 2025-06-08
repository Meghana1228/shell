#!/bin/bash
userid=$(id -u)
if [ $userid eq 0 ]
then 
echo " you are running with root access"
else 
echo " you are not running with root access"
exit 1
fi