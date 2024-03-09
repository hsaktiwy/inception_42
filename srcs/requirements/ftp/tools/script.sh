#!/bin/bash

# creat our hosting folder
mkdir -p $FTP_ROOT
# lets creat our ftp user
    # creat our user with no password
        adduser --disabled-password --gecos "" "$FTP_USER"
    # gave our user a chpasswd
        echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
# let add our user to our ftp userlist file :vsftpd.userlist (tee -a : will added and append the echo value to our userlist file)
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
# lets run our ftp server
    vsftpd /etc/vsftpd.conf