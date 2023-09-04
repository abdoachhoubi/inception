FROM debian:bullseye

RUN apt-get update && apt install vim vsftpd ftp -y

COPY ./config/vsftpd.conf /etc/vsftpd.conf

COPY ./script/script.sh script.sh

RUN chmod +x script.sh

CMD ["./script.sh"]
