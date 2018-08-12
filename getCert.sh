#!/bin/bash
docker run -it --rm -v hyku_certs:/etc/letsencrypt -v hyku_certs-data:/data/letsencrypt certbot/certbot certonly --test-cert --webroot --webroot-path=/data/letsencrypt -d 'up2.digitalnest.co.uk,repo1.up2.digitalnest.co.uk,repo2.up2.digitalnest.co.uk'
