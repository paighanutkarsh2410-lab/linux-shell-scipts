#!/bin/bash

# Package Installation Script
# Purpose: Install packages automatically based on user input


if [ $# -lt 1 ]

then

    echo "Usage: $0 package_name"
    echo "Example: $0 nginx"

    exit 1

fi



PACKAGE=$1



echo "Checking package manager..."



if command -v dnf &>/dev/null

then

    PACKAGE_MANAGER="dnf"


elif command -v yum &>/dev/null

then

    PACKAGE_MANAGER="yum"


elif command -v apt &>/dev/null

then

    PACKAGE_MANAGER="apt"


else

    echo "No supported package manager found"

    exit 1

fi



echo "Using package manager: $PACKAGE_MANAGER"



echo "Installing $PACKAGE..."



if [ "$PACKAGE_MANAGER" = "apt" ]

then

    apt update

    apt install -y "$PACKAGE"


else

    $PACKAGE_MANAGER install -y "$PACKAGE"

fi



if [ $? -eq 0 ]

then

    echo "$PACKAGE installed successfully"

else

    echo "Installation failed"

fi