FROM debian:bullseye

# Install Nginx and OpenSSL
RUN apt-get update && apt-get install -y nginx && apt-get install -y openssl

WORKDIR /etc/nginx

# Copy the configuration file
COPY ./config/nginx.conf .

# Copy the script that will create the SSL certificate
COPY ./config/ssl-gen.sh /tmp/ssl-gen.sh

# Change the permissions of the script
RUN chmod +x /tmp/ssl-gen.sh

# Run the script
RUN /tmp/ssl-gen.sh

# Copy the script that will start Nginx
COPY ./script/start.sh /tmp/start.sh

# Change the permissions of the script
RUN chmod +x /tmp/start.sh

# Expose the port 443
EXPOSE 443

# Run the script
CMD ["/tmp/start.sh"]
