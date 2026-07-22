#!/bin/bash

# Log Cleanup Script
# Purpose: Remove old log files to maintain disk space


LOG_DIRECTORY="/var/log"

DAYS=30


echo "Log cleanup started: $(date)"



echo "Finding logs older than $DAYS days..."



find "$LOG_DIRECTORY" \
-type f \
-name "*.log" \
-mtime +"$DAYS" \
-print



find "$LOG_DIRECTORY" \
-type f \
-name "*.log" \
-mtime +"$DAYS" \
-delete



if [ $? -eq 0 ]

then

    echo "Old logs removed successfully"

else

    echo "Log cleanup failed"

fi



echo "Log cleanup completed: $(date)"