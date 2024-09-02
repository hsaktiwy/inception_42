FROM debian:bullseye
RUN apt update
RUN apt install -y apache2 wget php php-mysqli php-curl php-json
COPY ./conf/adminer.conf ./etc/apache2/sites-available/
COPY ./tools/script.sh .
# ENTRYPOINT ["./script.sh"]
ENTRYPOINT ["tail", "-f", "/dev/null"]