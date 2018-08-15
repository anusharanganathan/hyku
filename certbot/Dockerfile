FROM certbot/certbot

ENTRYPOINT ["certbot"]
# renew --dry-run -n --agree-tos --email test@digitalnest.co.uk --no-eff-email --keep --test-cert --webroot --webroot-path=/data/letsencrypt

CMD ["certonly", "--dry-run", "-n", "--agree-tos", "--email", "test@digitalnest.co.uk", "--no-eff-email", "--keep", "--test-cert", "--webroot", "--webroot-path=/data/letsencrypt", "-d", "up2.digitalnest.co.uk,repo1.up2.digitalnest.co.uk,repo2.up2.digitalnest.co.uk"]
