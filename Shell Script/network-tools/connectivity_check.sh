#!/bin/bash

# Network Connectivity Check Script
# Purpose: Check connectivity to multiple servers


HOSTS=("google.com" "8.8.8.8" "localhost")


LOG_FILE="/tmp/network_check.log"


echo "==================================" > $LOG_FILE

echo "Network Check Report" >> $LOG_FILE

echo "Date: $(date)" >> $LOG_FILE

echo "==================================" >> $LOG_FILE



for HOST in "${HOSTS[@]}"

do


    ping -c 2 "$HOST" > /dev/null 2>&1



    if [ $? -eq 0 ]

    then

        echo "$HOST is reachable" | tee -a $LOG_FILE


    else

        echo "$HOST is unreachable" | tee -a $LOG_FILE


    fi


done



echo ""

echo "Report saved at $LOG_FILE"