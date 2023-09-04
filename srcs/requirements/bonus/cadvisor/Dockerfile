FROM debian:bullseye

RUN apt-get update && apt-get install -y curl

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.39.0/cadvisor -o /cadvisor

RUN chmod +x /cadvisor

EXPOSE 8080

CMD ["/cadvisor"]
