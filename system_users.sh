#!/bin/bash

#########################
# Script                #
#########################

# Get options

usage()
{
cat << EOF
usage: $0 options

This script creates local users.

OPTIONS:
   -i       Install password library (required once)
   -f       Users list file (mandatory)
   -g       Users group (optional)
   -p       Initial password (optional)
   -h       Shows script information
EOF
}

INSTALL  = false
FILE     =
GROUP    = "students"
PASSWORD = "holaHT1357**"

while getopts "hif:p:" OPTION
do
    case $OPTION in
        i)
            INSTALL=true
            ;;
        f)
            FILE=$OPTARG
            ;;
        f)
            GROUP=$OPTARG
            ;;
        p)
            PASSWORD=$OPTARG
            ;;
        h|?)
            usage
            exit
            ;;
    esac
done

# Check options

if [[ "$INSTALL" = false ]] || [[ -z "$FILE" ]]; then
    echo "Missing options"
    usage
    exit 1
fi

#########################
# Passwords policy      #
#########################

# 12 chars minimum including 2 minus, 2 MAYUS and 2 symbols
# TODO config sslguard

if [[ "$INSTALL" = true ]]; then
    lib = "libpam-cracklib"
    echo "Install and configure $lib package"
    # Install package
    sudo apt install $lib
    # Configure
    line = "password    requisite   pam_cracklib.so retry=3 difok=3 dcredit=-2 lcredit=-2 minlen=12 ocredit=-2 ucredit=-2"
    sed -i "1s/^/$line\n/" /etc/pam.d/common-password
fi

#########################
# Users creation        #
#########################

if [[ -n "$FILE" ]]; then

    if  [[ ! -e "$FILE" ]]; then
        echo "File not exits: $FILE"
        exit 1
    fi

    groupadd $GROUP

    users=$(cat $FILE) || exit 1

    for u in $users; do
        # Create user
        echo "Creating user=$u password=$u"
        groupadd $u
        useradd --home /home/$u --create-home --gid $u $u || exit 1
        # Change password
        if [[ -n "$PASSWORD" ]]; then
            echo "Pass for $u"
            echo  "$p\n$p" | passwd $u
        fi
        # Add user to group
        echo "Adding user $u to group $GROUP"
        usermod -a -G $GROUP $u
    done

fi