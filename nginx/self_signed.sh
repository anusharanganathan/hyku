#!/bin/bash
echo "command 1"
openssl version
openssl genrsa -des3 -passout pass:x -out /etc/selfsigned/server.pass.key 2048
echo "command 2"
ls -la /etc/selfsigned/
openssl rsa -passin pass:x -in /etc/selfsigned/server.pass.key -out /etc/selfsigned/server.key
echo "command 3"
rm /etc/selfsigned/server.pass.key
echo "command 4"
openssl req -new -key /etc/selfsigned/server.key -out /etc/selfsigned/server.csr -subj "/C=GB/ST=London/L=London/O=UP/OU=UP/CN=up2.digitalnest.co.uk"
echo "command 5"
openssl x509 -req -sha256 -days 300065 -in /etc/selfsigned/server.csr -signkey /etc/selfsigned/server.key -out /etc/selfsigned/server.crt
