#!/bin/bash

# Generate SSL certificate if none exists
if ([ ! -f /etc/certs/server.key ] || [ ! /etc/certs/server.crt ]); then
  openssl genrsa -des3 -passout pass:averylongpassword -out /etc/certs/server.pass.key 2048
  openssl rsa -passin pass:averylongpassword -in /etc/certs/server.pass.key -out /etc/certs/server.key
  rm /etc/certs/server.pass.key
  echo ${DOMAIN}
  openssl req -new -key /etc/certs/server.key -out /etc/certs/server.csr -subj "/C=GB/ST=London/L=London/O=UP/OU=UP/CN=$DOMAIN"
  openssl x509 -req -sha256 -days 300065 -in /etc/certs/server.csr -signkey /etc/certs/server.key -out /etc/certs/server.crt
fi

# Substitute environment variables in the Nginx config file and copy it
envsubst '$$DOMAIN' < /data/nginx.conf > /etc/nginx/conf.d/default.conf

