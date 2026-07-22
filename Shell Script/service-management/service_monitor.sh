#!/bin/bash

# Linux Service Monitoring Script
# Purpose: Check whether important services are running
# If service is stopped, attempt to restart it


SERVICES=("sshd" "httpd" "firewalld")


LOG_FILE="/var/log/service_monitor.log"


echo "==================================" >> $LOG_FILE
echo "Service Check Report: $(date)" >> $LOG_FILE
echo "==================================" >> $LOG_FILE



for SERVICE in "${SERVICES[@]}"

do

    STATUS=$(systemctl is-active "$SERVICE")


    if [ "$STATUS" = "active" ]

    then

        echo "$SERVICE is running" | tee -a $LOG_FILE


    else

        echo "$SERVICE is stopped. Attempting restart..." | tee -a $LOG_FILE


        systemctl restart "$SERVICE"


        if [ $? -eq 0 ]

        then

            echo "$SERVICE restarted successfully" | tee -a $LOG_FILE

        else

            echo "Failed to restart $SERVICE" | tee -a $LOG_FILE

        fi

    fi


done