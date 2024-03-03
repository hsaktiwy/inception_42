FROM debian:bullseye
RUN apt-get update
RUN apt-get install curl wget unzip -y
RUN apt-get install php7.4-fpm php-mysql mariadb-client -y
COPY ./tools/script.sh .

ENTRYPOINT ["bash", "script.sh"]