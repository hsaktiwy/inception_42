#!/bin/bash

mkdir -p $FTP_ROOT
adduser --disabled-password --gecos "" "$FTP_USER"
echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
mkdir -p /var/run/vsftpd/empty
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
usermod -aG www-data $FTP_USER
chmod -R 755 $FTP_ROOT
echo "local_root=$FTP_ROOT" >> /etc/vsftpd.conf
exec vsftpd /etc/vsftpd.conf