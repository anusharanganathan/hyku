#!/bin/bash

# Create self-signed certificates
sh -c "/data/self_signed.sh"

# Start NGinx in daemon mode
echo "starting NGinx in daemon mode"
/usr/sbin/nginx

# Create CA certificates
sh -c "/data/create_cert.sh"

# Manage CA certificates
sh -c "/data/manage_cert.sh"

# Stop NGinx. Let supervisor manage NGinx
/usr/sbin/nginx -s stop

# Start supervisor
/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
