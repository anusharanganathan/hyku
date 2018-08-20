#!/bin/bash
if [ -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem ] && \
   [ -f /etc/letsencrypt/live/$DOMAIN/privkey.pem ] && \
   [ -f /etc/letsencrypt/live/$DOMAIN/chain.pem ]
then
  # Let's Encrypt certificates exist

  # Copy Let's Encrypt nginx conf files
  echo "Copying Let's Encrypt nginx conf"
  bash -c 'envsubst '"'"'$DOMAIN'"'"' < /data/nginx_ssl.conf > /etc/nginx/conf.d/default.conf'

  # Reload nginx
  echo "Reload nginx"
  /usr/sbin/nginx -s reload

  # Set cron for renewing certificates
  echo "Setting crontab for renewing certificates"
  crontab /data/cron_data
fi
