FROM debian:bullseye
RUN apt-get update
# remove the unzip
RUN apt-get install curl wget unzip -y
RUN apt-get install php7.4-fpm php-mysql mariadb-client -y
COPY ./tools/script.sh .
EXPOSE 9000
ENTRYPOINT ["bash", "script.sh"]
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]