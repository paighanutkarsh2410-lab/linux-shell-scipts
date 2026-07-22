#!/bin/bash

# Linux User Deletion Script
# Purpose: Delete users from a provided list


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

        userdel -r "$USERNAME"

        if [ $? -eq 0 ]
        then
            echo "$USERNAME deleted successfully"
        else
            echo "Failed to delete $USERNAME"
        fi


    else

        echo "$USERNAME does not exist"

    fi


done < "$USER_FILE"