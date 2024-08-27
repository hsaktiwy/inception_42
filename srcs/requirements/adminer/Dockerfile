FROM debian:bullseye
RUN apt update
RUN apt install -y apache2 adminer 
COPY ./conf/adminer.conf ./etc/apache2/sites-available/
COPY ./tools/script.sh .
ENTRYPOINT ["script.sh"]