FROM debian:bullseye

# install mariadb
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /db

COPY config/config.sh .
COPY config/conf.sql .

CMD ["sh", "/db/config.sh"]
