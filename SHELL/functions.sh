#!/bin/bash

#FUNCTION
VALIDATION() 
{   if [ "$1" -eq 0 ];
    then
       echo " $2 Installation Successful"
   else
       echo " $2 Installation Failed"
       exit 1
   fi
}
#FUNCTION END

#FUNCTION USE CASE
TIME=$(date +%F-%H-%M-%S)
LOG=/tmp/$0-$TIME.log
ID=$(id -u)
if [ $ID -eq 0 ]; then
   echo "ROOT User"
else
   echo " Not a ROOT User"
   exit 1 &>>"$LOG"
fi

yum install mysql -y &>>"$LOG"

VALIDATION $? mysql

yum install git -y &>>"$LOG"

VALIDATION $? Git
