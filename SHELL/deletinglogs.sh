#!/bin/bash

read -rp "Enter log path to delete them :" LOCATION
LOGSOURCE=$(dirname "${LOCATION}")
if [ ! -d "$LOGSOURCE" ]; 
then
   echo " ${LOGSOURCE} Directory doesnt exist"
   exit 1;
fi
cd "${LOGSOURCE}"
LOGSTODELETE=$(find . -type f -mtime +14 -name "*.log") 
while IFS=$'\n' read -r filename
do
   echo "Deleting ${filename}";
   rm -f "${filename}";
done <<< "${LOGSTODELETE}"
