#!/bin/bash

# Disk Usage Monitoring Script
# Purpose: Check filesystem usage and alert when threshold exceeds


THRESHOLD=80


echo "Disk Usage Report"
echo "================="


df -h | grep -v Filesystem | while read LINE

do

    USAGE=$(echo $LINE | awk '{print $5}' | sed 's/%//')

    PARTITION=$(echo $LINE | awk '{print $6}')


    if [ "$USAGE" -ge "$THRESHOLD" ]

    then

        echo "WARNING: $PARTITION usage is ${USAGE}%"

    else

        echo "$PARTITION usage is normal (${USAGE}%)"

    fi


done