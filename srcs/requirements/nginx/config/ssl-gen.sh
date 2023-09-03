#!/bin/bash

# Gen ssl key and cert
if [ ! -d "/etc/nginx/ssl" ]; then
	mkdir -p /etc/nginx/ssl
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.crt -subj "/C=KR/ST=BG/L=BG/O=1337BG/OU=Astro/CN=LeetNetwork" > /dev/null 2>&1
	echo "ssl key and cert generated"
	exit 0
fi

echo "ssl key and cert already exist"
