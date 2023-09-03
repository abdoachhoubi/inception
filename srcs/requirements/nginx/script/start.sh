#! /bin/bash

chown www-data:www-data /var/www/html/ -R

rm sites-enabled/default

rm sites-available/default

nginx -g "daemon off;"