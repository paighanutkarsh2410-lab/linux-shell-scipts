#!/bin/bash

# Linux User Creation Script
# Creates users from a text file


USER_FILE=$1


if [ $# -ne 1 ]
then
    echo "Usage: $0 username_file"
    exit 1
fi



if [ ! -f "$USER_FILE" ]
then
    echo "User file not found"
    exit 1
fi



while read USERNAME

do

    if id "$USERNAME" &>/dev/null

    then
        echo "$USERNAME already exists"

    else

        useradd "$USERNAME"

        echo "$USERNAME created successfully"

        echo "$USERNAME:Password@123" | chpasswd

    fi


done < "$USER_FILE"