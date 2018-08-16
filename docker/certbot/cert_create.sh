#!/bin/sh

# function to add domains
add_domains() {
  domains="$DOMAIN"
  for i in $TENANTS;
  do
    domains="$domains,$i.$DOMAIN";
  done
  echo "$domains";
}

domains=$(add_domains);

echo "Getting certificate";

certbot certonly -n --agree-tos --no-eff-email --keep --test-cert \
  --email "$EMAIL" \
  --webroot --webroot-path=/data/letsencrypt \
  -d "$domains" --post-hook /data/cert_create_status.sh

tail -f /dev/null
