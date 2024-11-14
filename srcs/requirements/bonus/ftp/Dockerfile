FROM debian:bullseye
RUN apt-get update
RUN apt-get install vsftpd -y
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/script.sh ./script.sh
ENTRYPOINT [ "./script.sh" ]