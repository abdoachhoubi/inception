FROM debian:buster

# Install MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Copy the configuration file
COPY ./config/50.server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script that will create the database
COPY ./script/config.sh /tmp/config.sh

# Change the permissions of the script
RUN chmod +x /tmp/config.sh

# Run the script
CMD ["/tmp/config.sh"]
