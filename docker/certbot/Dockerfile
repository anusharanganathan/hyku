FROM certbot/certbot

COPY ./docker/certbot/cert_create.sh /data/cert_create.sh
RUN chmod +x /data/cert_create.sh
COPY ./docker/certbot/cert_create_status.sh /data/cert_create_status.sh
RUN chmod +x /data/cert_create_status.sh

ENTRYPOINT ["sh", "-c", "/data/cert_create.sh"]
