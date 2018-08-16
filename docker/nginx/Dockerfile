# Base image:
FROM nginx
# Install dependencies
RUN apt-get update -qq && apt-get -y install apache2-utils openssl

# establish where Nginx should look for files
ENV WEB_ROOT /var/www/web_server

# Set our working directory inside the image
WORKDIR $WEB_ROOT

# create log directory
RUN rm -rf log
RUN mkdir log

# copy over static assets
COPY public public/

# Copy Nginx config
COPY ./docker/nginx/nginx.conf /data/nginx.conf

# Copy Nginx config for certbot ssl
COPY ./docker/nginx/nginx_ssl.conf /data/nginx_ssl.conf

# Copy scripts
COPY ./docker/nginx/self_signed.sh /data/self_signed.sh
RUN chmod +x /data/self_signed.sh

EXPOSE 80 443

# Create self signed certificate and start nginx
CMD [ "sh", "-c", "/data/self_signed.sh; tail -f/dev/null;" ]

