FROM debian:bullseye
RUN apt update
RUN apt install -y wget php php-mysqli php-curl php-json
COPY ./tools/script.sh .
ENTRYPOINT ["./script.sh"]