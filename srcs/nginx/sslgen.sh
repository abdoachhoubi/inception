#!/bin/bash

# Gen ssl key and cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./ssl/private/nginx-selfsigned.key -out ./ssl/certs/nginx-selfsigned.crt -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=lhbibatwilafuck"