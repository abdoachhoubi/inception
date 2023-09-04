#!/bin/bash

# Define the username
username=$FTP_USER

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User $username already exists."
else
    # If the user does not exist, create it
    useradd -m -p $(openssl passwd -1 $FTP_PASSWORD) "$username"
    echo "User $username has been created."
fi

if [ ! -d "/var/run/vsftpd/empty" ]; then
	mkdir -p /var/run/vsftpd/empty
fi

# Start vsftpd
vsftpd /etc/vsftpd.conf
