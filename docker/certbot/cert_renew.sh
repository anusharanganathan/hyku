#!/bin/sh

# Renew the certificate
docker run -i hyku_get_cert certbot renew --post-hook '/data/cert_renew_status.sh'
