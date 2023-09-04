#!/bin/bash

service mariadb start

sleep 5

mariadb -e	"CREATE DATABASE IF NOT EXISTS $WP_DATABASE"
mariadb -e	"CREATE USER  IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD'"
mariadb -e	"GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_USER'@'%';"
mariadb -e	"FLUSH PRIVILEGES;"
# mariadb -e	"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

mariadbd