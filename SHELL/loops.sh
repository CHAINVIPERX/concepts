#!/bin/bash

#IF LOOP

number=$1
if [ $number -gt 50 ]
then
   echo " The number $number is greater than 50"
else
  echo "The number $number is smaller than 50"
fi

ID=$(id -u)
if [ "$ID" -eq 0 ]; then
  echo "ROOT User"
else
  echo " Not a ROOT User"
   exit 1
fi

#FOR LOOP

for i in {1..1054}; do
   echo "$i"
done