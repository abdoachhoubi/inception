#!/bin/bash

# Start the mysql daemon in the background.
service mysql start

# Because we need to wait for the mysql daemon to start before running the rest of the script.
sleep 3

# Create a database and a user with full privileges.
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';"

mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DATABASE;"

mysql -e "GRANT ALL PRIVILEGES ON $WP_DATABASE.* to '$MYSQL_USER'@'%';"

mysql -e "FLUSH PRIVILEGES;"

# Create root user.
mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"


# Stop the mysql daemon.
service mysql stop

# Start the mysql daemon in the foreground.
mysqld_safe