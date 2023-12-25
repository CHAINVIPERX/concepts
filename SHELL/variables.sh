!/bin/bash

p1=Juliet
p2=Romeo

echo "$p1:I Love You"
echo "$p2:Okay.Love you too"
echo "$p1:Its a Prank"

DATE=$(date)
echo "Date and time is ${DATE}"

echo "Please enter your Age"
read AGE
echo "Age is $AGE"

#ARITHMETIC OPERATIONS
n1=$1
n2=$2

SUM=$((n1+n2))
echo "sum of $n1 and $n2 is $SUM"