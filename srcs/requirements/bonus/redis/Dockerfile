FROM debian:bullseye
RUN apt-get update
RUN apt-get install redis-server -y
COPY ./tools/script.sh ./script.sh
RUN chmod +x script.sh
ENTRYPOINT [ "./script.sh"]