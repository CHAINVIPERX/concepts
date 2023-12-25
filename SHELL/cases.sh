#!/bin/bash

echo " enter d to see date"
echo " enter pd to see present working directory"
read -r RESPONSE 

#CASE

caseresponse="${RESPONSE,,}"
case $caseresponse in
d) date;;
pd) pwd;;
*) echo "Invalid input";;
esac

#EXAMPLE OF CASE USING FUNCTION

read -rp "Enter 2 numbers" A B
read -rp "Enter a for addition , s for substraction" RESPONSE
addition()
{
   answer=$(($1+$2));
   echo " $1 + $2 is = ${answer}"
}
substraction()
{

  echo " $1-$2 is $(($1-$2))"
}
caseresponse="${RESPONSE,,}"
case $caseresponse in
a) addition "$A" "$B" ;;
s) substraction "$A" "$B" ;;
*) echo "Invalid input" ;;
esac
