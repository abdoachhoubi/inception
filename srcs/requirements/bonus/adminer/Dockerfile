FROM debian:bullseye

RUN apt-get update && apt-get install wget php php-mysql -y

RUN wget https://www.adminer.org/latest.php -O adminer.php


CMD ["php", "-S", "0.0.0.0:8080", "adminer.php"]
