FROM debian:bullseye

# Install nginx
RUN apt-get update && apt-get install -y nginx openssl

# Set working directory
WORKDIR /srcs

COPY index.html .

# Copy nginx config
COPY ./default.conf /etc/nginx/conf.d/

# Copy ssl config
COPY ./ssl/certs/nginx-selfsigned.crt /etc/nginx/ssl/certs/
COPY ./ssl/private/nginx-selfsigned.key /etc/nginx/ssl/private/

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
