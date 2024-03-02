FROM debian:bullseye
RUN apt-get update
RUN apt-get install mariadb-server -y
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.js .
EXPOSE 3306
CMD ["./script.js"]
