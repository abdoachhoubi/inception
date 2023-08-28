FROM debian:buster

# Install nginx
RUN apt-get update && apt-get install -y nginx openssl

# create ssl directory
# RUN sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# Set working directory
WORKDIR /test

COPY index.html .


# Copy nginx config
COPY ./default.conf /etc/nginx/conf.d/

# Copy ssl config
COPY ./ssl/certs/nginx-selfsigned.crt /etc/nginx/ssl/certs/
COPY ./ssl/private/nginx-selfsigned.key /etc/nginx/ssl/private/

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
