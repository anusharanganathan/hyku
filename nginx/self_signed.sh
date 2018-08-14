#!/bin/bash
openssl version
openssl genrsa -des3 -passout pass:averylongpassword -out /etc/selfsigned/server.pass.key 2048
openssl rsa -passin pass:averylongpassword -in /etc/selfsigned/server.pass.key -out /etc/selfsigned/server.key
rm /etc/selfsigned/server.pass.key
openssl req -new -key /etc/selfsigned/server.key -out /etc/selfsigned/server.csr -subj "/C=GB/ST=London/L=London/O=UP/OU=UP/CN=up2.digitalnest.co.uk"
openssl x509 -req -sha256 -days 300065 -in /etc/selfsigned/server.csr -signkey /etc/selfsigned/server.key -out /etc/selfsigned/server.crt
nginx -g "daemon off;"
