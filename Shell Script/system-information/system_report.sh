#!/bin/bash

# Linux System Information Report
# Purpose: Generate complete server information report


REPORT="/tmp/system_information_report.txt"



echo "=================================" > $REPORT

echo " Linux System Information Report" >> $REPORT

echo "Generated: $(date)" >> $REPORT

echo "=================================" >> $REPORT



echo "" >> $REPORT

echo "Hostname:" >> $REPORT

hostname >> $REPORT



echo "" >> $REPORT

echo "Operating System:" >> $REPORT

cat /etc/os-release >> $REPORT



echo "" >> $REPORT

echo "Kernel Version:" >> $REPORT

uname -r >> $REPORT



echo "" >> $REPORT

echo "CPU Information:" >> $REPORT

lscpu | grep "Model name" >> $REPORT



echo "" >> $REPORT

echo "Memory Information:" >> $REPORT

free -h >> $REPORT



echo "" >> $REPORT

echo "Disk Information:" >> $REPORT

df -h >> $REPORT



echo "" >> $REPORT

echo "Mounted Filesystems:" >> $REPORT

mount | column -t >> $REPORT



echo "" >> $REPORT

echo "Network Interfaces:" >> $REPORT

ip addr >> $REPORT



echo "" >> $REPORT

echo "Currently Logged In Users:" >> $REPORT

who >> $REPORT



echo "" >> $REPORT

echo "Running Services:" >> $REPORT

systemctl --type=service --state=running >> $REPORT



echo ""

echo "System report generated successfully"

echo "Location: $REPORT"