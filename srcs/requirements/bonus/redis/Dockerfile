FROM debian:bullseye
RUN apt-get update
RUN apt-get install redis-server -y
COPY ./tools/script.sh ./script
ENTRYPOINT [ "./script"]