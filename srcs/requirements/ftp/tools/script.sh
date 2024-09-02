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

    # added the user of ftp to the ww-dat groupd allowing him to have the privilege to edit/create a file in the hosted folder
    usermod -aG www-data $FTP_USER
    # i notice that the www-data gourp permission on the hosted file are only read and execute so let add write
    chmod 775 $FTP_ROOT
    # and like this we allowed our ftp user to access ftp hosted folder properly (i think hahaha! or maybe not?)

# added the local_root=$FTP_ROOT to the vsftpd.conf at the end of the configuration
echo "local_root=$FTP_ROOT" >> /etc/vsftpd.conf
# lets run our ftp server
exec vsftpd /etc/vsftpd.conf