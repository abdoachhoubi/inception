FROM debian:bullseye

RUN apt-get update && apt-get install  nginx vim -y

RUN rm -rf /var/www/html/*

COPY . /var/www/html/

CMD ["nginx", "-g", "daemon off;"]'
