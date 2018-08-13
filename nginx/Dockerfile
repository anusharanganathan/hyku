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

# Copy Nginx config template
COPY nginx/nginx.conf /tmp/docker.nginx
COPY nginx/self_signed.sh /tmp/self_signed.sh
RUN chmod +x /tmp/self_signed.sh
# RUN /tmp/self_signed.sh

# substitute variable references in the Nginx config template for real values from the environment
# put the final config in its place
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80 443

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "/tmp/self_signed.sh", "&&", "nginx", "-g", "daemon off;" ]

