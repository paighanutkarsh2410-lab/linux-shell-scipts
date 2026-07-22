#!/bin/bash

# System Health Monitoring Script
# Purpose: Generate CPU, Memory and Disk usage report


REPORT="/tmp/system_health_report.txt"


echo "===============================" > $REPORT
echo " System Health Report" >> $REPORT
echo " Generated: $(date)" >> $REPORT
echo "===============================" >> $REPORT


echo "" >> $REPORT
echo "Hostname:" >> $REPORT
hostname >> $REPORT


echo "" >> $REPORT
echo "Uptime:" >> $REPORT
uptime >> $REPORT


echo "" >> $REPORT
echo "CPU Usage:" >> $REPORT

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}')

echo "CPU Usage: ${CPU}%" >> $REPORT



echo "" >> $REPORT
echo "Memory Usage:" >> $REPORT

MEM=$(free | grep Mem | awk '{print ($3/$2)*100}')

echo "Memory Usage: ${MEM}% " >> $REPORT



echo "" >> $REPORT
echo "Disk Usage:" >> $REPORT

df -h / >> $REPORT



echo "" >> $REPORT
echo "Running Services:" >> $REPORT

systemctl --type=service --state=running >> $REPORT


echo "" >> $REPORT
echo "Report generated successfully."

echo "Location: $REPORT"