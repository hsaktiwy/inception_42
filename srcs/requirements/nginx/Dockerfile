FROM debian:bullseye
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/script.sh .
RUN chmod +x script.sh
ENTRYPOINT ["./script.sh"]
