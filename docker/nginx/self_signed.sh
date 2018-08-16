#!/bin/bash

# Generate SSL certificate if none exists
if ([ ! -f /etc/selfsigned/server.key ] || [ ! /etc/selfsigned/server.crt ]); then
  openssl genrsa -des3 -passout pass:averylongpassword -out /etc/selfsigned/server.pass.key 2048
  openssl rsa -passin pass:averylongpassword -in /etc/selfsigned/server.pass.key -out /etc/selfsigned/server.key
  rm /etc/selfsigned/server.pass.key
  openssl req -new -key /etc/selfsigned/server.key -out /etc/selfsigned/server.csr -subj "/C=GB/ST=London/L=London/O=UP/OU=UP/CN=$DOMAIN"
  openssl x509 -req -sha256 -days 300065 -in /etc/selfsigned/server.csr -signkey /etc/selfsigned/server.key -out /etc/selfsigned/server.crt
fi

# Substitute environment variables in the Nginx config file and copy it
envsubst '$$DOMAIN' < /data/nginx.conf > /etc/nginx/conf.d/default.conf

# Start nginx
nginx -g "daemon off;"
