#!/bin/bash

# Large File Finder Script
# Purpose: Find files consuming large disk space


DIRECTORY=$1
SIZE=$2



if [ $# -ne 2 ]

then

    echo "Usage: $0 <directory> <size>"
    echo "Example: $0 /var 500M"

    exit 1

fi



if [ ! -d "$DIRECTORY" ]

then

    echo "Directory does not exist"

    exit 1

fi



echo "Searching files larger than $SIZE in $DIRECTORY"

echo "============================================"



find "$DIRECTORY" -type f -size +"$SIZE" -exec ls -lh {} \;



echo ""

echo "Search completed"