#!/bin/bash

# Directory Backup Script
# Creates compressed backup with timestamp


SOURCE=$1
BACKUP_DIR=$2


if [ $# -ne 2 ]
then
    echo "Usage: $0 <source_directory> <backup_location>"
    exit 1
fi



if [ ! -d "$SOURCE" ]
then
    echo "Source directory does not exist"
    exit 1
fi



DATE=$(date +"%Y-%m-%d_%H-%M-%S")


BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"



mkdir -p "$BACKUP_DIR"



tar -czf "$BACKUP_FILE" "$SOURCE"



if [ $? -eq 0 ]
then
    echo "Backup completed successfully"
    echo "Backup file: $BACKUP_FILE"

else
    echo "Backup failed"
fi