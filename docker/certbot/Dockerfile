FROM certbot/certbot

COPY docker/certbot/cert_create_status.sh /tmp/cert_create_status.sh

ENTRYPOINT ["certbot", "certonly", "-n", "--agree-tos", "--email", "test@digitalnest.co.uk", "--no-eff-email", "--keep", "--test-cert", "--webroot", "--webroot-path=/data/letsencrypt", "-d", "up2.digitalnest.co.uk,repo1.up2.digitalnest.co.uk,repo2.up2.digitalnest.co.uk", "--post-hook", "/tmp/cert_create_status.sh"]
