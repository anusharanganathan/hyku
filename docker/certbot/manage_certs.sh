#!/bin/bash
if [ -e /data/letsencrypt/cert_installed ]
then
  # Copy certbot nginx conf files and restart nginx

  echo "Copying certbot nginx conf"
  docker exec hyku_web_server_1 bash -c 'envsubst '"'"'$DOMAIN'"'"' < /data/nginx_ssl.conf > /etc/nginx/conf.d/default.conf'

  echo "Reload nginx"
  docker exec hyku_web_server_1 nginx -s reload

  # Do not delete status file. We need the certbot ssl config file copied
  # rm /data/letsencrypt/cert_installed

  # Start cron to renew certificate. Run certbot renew using certbot service
  # If cert_renew_status, reload nginx
fi
