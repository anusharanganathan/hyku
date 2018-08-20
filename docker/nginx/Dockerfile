# Base image:
FROM anusha3/nginx-shibboleth-certbot:1.0

# establish where Nginx should look for files
ENV WEB_ROOT /var/www/web_server

ARG DOMAIN
ARG TENANTS
ARG EMAIL

# Set our working directory inside the image
WORKDIR $WEB_ROOT

# create log directory
RUN rm -rf log
RUN mkdir log
RUN mkdir -p /etc/certs /data/letsencrypt

# copy over static assets
COPY public public/

# Copy Nginx config files
COPY ./docker/nginx/nginx.conf /data/nginx.conf
COPY ./docker/nginx/nginx_ssl.conf /data/nginx_ssl.conf

# Copy scripts
COPY ./docker/nginx/self_signed.sh /data/self_signed.sh
COPY ./docker/nginx/create_cert.sh /data/create_cert.sh
COPY ./docker/nginx/manage_cert.sh /data/manage_cert.sh
RUN chmod +x /data/*.sh

# COPY Cron data
COPY ./docker/nginx/cron_data /data/cron_data

EXPOSE 80 443

# Create self signed certificate
RUN sh -c "/data/self_signed.sh"

# Create Let's Encrypt certificates
# RUN sh -c "/data/create_cert.sh"

# Manage Let's Encrypt certificates
# RUN sh -c "/data/manage_cert.sh"

# Start Nginx
CMD [ "sh", "-c", "nginx && /data/create_cert.sh && /data/manage_cert.sh && tail -F /dev/null;"]

