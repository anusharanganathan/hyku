# Base image:
FROM anusha3/nginx-shibboleth-certbot:1.0

# establish where Nginx should look for files
ENV WEB_ROOT /var/www/web_server

# Set our working directory inside the image
WORKDIR $WEB_ROOT
RUN apt-get update && apt-get install -y procps

# create log directory
RUN rm -rf log
RUN mkdir log
RUN mkdir -p /etc/selfsigned /etc/letsencrypt /data/letsencrypt

# copy over static assets
COPY public public/

# Copy Nginx config files
COPY ./docker/nginx/nginx.conf /data/nginx.conf
COPY ./docker/nginx/nginx_ssl.conf /data/nginx_ssl.conf
COPY ./docker/nginx/shib_clear_headers /etc/nginx/shib_clear_headers

# Copy scripts
COPY ./docker/nginx/start.sh /data/start.sh
COPY ./docker/nginx/self_signed.sh /data/self_signed.sh
COPY ./docker/nginx/create_cert.sh /data/create_cert.sh
COPY ./docker/nginx/manage_cert.sh /data/manage_cert.sh
RUN chmod +x /data/*.sh

# Copy Shibboleth2.xml
COPY ./docker/nginx/shibboleth2.xml /etc/shibboleth/

# COPY Cron data
COPY ./docker/nginx/cron_data /data/cron_data

EXPOSE 80 443

# Start NGinx, manage certificates, start supervisor for NGinx and Shibboleth
CMD [ "sh", "-c", "/data/start.sh && tail -F /dev/null;"]
