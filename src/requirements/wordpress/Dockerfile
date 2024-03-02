FROM debian:bullseye
RUN apt-get update
RUN apt-get install curl wget unzip -y
RUN apt-get install php7.4-fpm -y
COPY ./tools/script.sh .
ENV SQL_DATABASE=HAHAHA
ENV SQL_USER=Hamza
ENV SQL_PASSWORD=SOLO


ENTRYPOINT ["bash", "script.sh"]