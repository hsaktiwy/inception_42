FROM debian:bullseye

RUN apt update
RUN apt install nginx -y

COPY tools/myWebsite/ /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]