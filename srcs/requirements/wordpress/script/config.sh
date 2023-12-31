#!/bin/bash

# Wait for the mysql daemon to start before running the rest of the script.
sleep 10

# Download and install WordPress CLI.
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/html/

# Create a wp-config.php file.
wp config create --dbname=$WP_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASSWORD --dbhost=$DB_HOST --dbcharset="utf8" --dbcollate="" --allow-root

# Add redis configuration to the beginning of wp-config.php
sed -i "2i define('WP_REDIS_HOST', 'redis');" wp-config.php
sed -i "3i define('WP_CACHE', true);" wp-config.php
sed -i "4i define('WP_REDIS_PORT', '6379');" wp-config.php
sed -i "5i define('WP_REDIS_DATABASE', '0');" wp-config.php
# define('WP_REDIS_HOST', 'redis');
# define('WP_CACHE', true);
# define('WP_REDIS_PORT', '6379');
# define('WP_REDIS_DATABASE', '0');

# Install WordPress and create an admin user.
wp core install --url=$WP_URL --title=$WP_SITE_TITLE --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

# Create a new user.
wp user create $WP_USER $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWORD --allow-root

# Run the php-fpm7.4 daemon in the foreground.
php-fpm7.4 -F
