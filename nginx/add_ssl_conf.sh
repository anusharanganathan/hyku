#!/bin/bash
docker exec hyku_web_server_1 cp /tmp/nginx_ssl.conf /etc/nginx/conf.d/default.conf
docker exec hyku_web_server_1 nginx -s restart
