# Base image:
FROM nginx
# Install dependencies
RUN apt-get update -qq && apt-get -y install apache2-utils openssl

# establish where Nginx should look for files
ENV RAILS_ROOT /var/www/web_server

# Set our working directory inside the image
WORKDIR $RAILS_ROOT

# create log directory
RUN rm -rf log
RUN mkdir log

# copy over static assets
COPY public public/

# Copy Nginx config
COPY docker/nginx/nginx.conf /tmp/docker.nginx

# Copy script to generate self signed certificate
COPY docker/nginx/self_signed.sh /tmp/self_signed.sh

# Copy Nginx config for certbot ssl
COPY docker/nginx/nginx_ssl.conf /tmp/nginx_ssl.conf

RUN chmod +x /tmp/self_signed.sh

# substitute variable references in the Nginx config template for real values from the environment
# put the final config in its place
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80 443

# Create self signed certificate and start nginx
CMD [ "/tmp/self_signed.sh" ]

