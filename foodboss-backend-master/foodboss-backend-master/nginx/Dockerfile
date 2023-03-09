# Base on offical NGINX Alpine image
FROM nginx:alpine

# Remove any existing config files
RUN rm /etc/nginx/conf.d/*

# Copy config files
# *.conf files in conf.d/ dir get included in main config
# COPY ./default.conf /etc/nginx/conf.d/
RUN adduser -u 1000 -D -S -G www-data www-data
COPY ./default.conf /etc/nginx/nginx.conf

# Expose the listening port
EXPOSE 80
EXPOSE 443

# Launch NGINX
CMD [ "nginx", "-g", "daemon off;" ]