FROM debian:bullseye

# Install php and php-fpm and some php extensions plus wget and unzip
RUN apt-get update && apt-get install -y unzip wget php7.4 php-fpm php-mysql sendmail mariadb-server

# Copy the script that will configure WordPress
COPY script/config.sh script.sh

# Change the permissions of the script
RUN chmod +x script.sh && mkdir -p /var/www/

# Download WordPress and move it to the right place
RUN wget https://wordpress.org/latest.zip && unzip latest.zip -d /var/www/ && mv /var/www/wordpress /var/www/html && service php7.4-fpm start

# Copy the configuration file for php-fpm
COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Expose the port 9000
EXPOSE 9000

# Run the script
CMD ["./script.sh"]
