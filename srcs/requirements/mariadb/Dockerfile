FROM debian:bullseye
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY ./tools/script.sh .
EXPOSE 3306
CMD ["./script.sh"]
