#!/bin/bash
if [ -f /etc/certs/live/$DOMAIN/fullchain.pem ] && \
   [ -f /etc/certs/live/$DOMAIN/privkey.pem ] && \
   [ -f /etc/certs/live/$DOMAIN/chain.pem ]
then
  # Let's Encrypt certificates exist

  # Copy Let's Encrypt nginx conf files and restart nginx
  echo "Copying Let's Encrypt nginx conf"
  bash -c 'envsubst '"'"'$DOMAIN'"'"' < /data/nginx_ssl.conf > /etc/nginx/conf.d/default.conf'

  echo "Reload nginx"
  nginx -s reload

  # Set cron
  crontab /data/cron_data
fi
