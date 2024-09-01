#!/bin/bash

# creat our hosting folder
mkdir -p $FTP_ROOT
# lets creat our ftp user
    # creat our user with no password
        adduser --disabled-password --gecos "" "$FTP_USER"
    # gave our user a chpasswd
        echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
    # create the security chroot dir
        mkdir -p /var/run/vsftpd/empty
# let add our user to our ftp userlist file :vsftpd.userlist (tee -a : will added and append the echo value to our userlist file)
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
echo "local_root=$FTP_ROOT" >> /etc/vsftpd.conf
# lets run our ftp server
exec vsftpd /etc/vsftpd.conf