#!/bin/bash

# Start the mysql daemon in the background.
service mysql start

# Because we need to wait for the mysql daemon to start before running the rest of the script.
sleep 3

# Create a database and a user with full privileges.
mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WP_DATABASE;"

mysql -u root -e "GRANT ALL PRIVILEGES ON $WP_DATABASE.* to '$MYSQL_USER'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"

# Stop the mysql daemon.
service mysql stop

# Start the mysql daemon in the foreground.
mysqld_safe