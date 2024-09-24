FROM debian:bullseye
RUN apt-get update
# remove the unzip
RUN apt-get install curl wget -y
RUN apt-get install php7.4-fpm php-mysql mariadb-client -y
COPY ./tools/script.sh .
ENTRYPOINT ["./script.sh"]