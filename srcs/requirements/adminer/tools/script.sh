#!/bin/bash
# create the adminer index.php folder
mkdir /var/www/adminer
# install adminer
cd  /var/www/adminer
wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
# gave the apache permission on our folder
chown www-data:www-data /var/www/adminer
chmod 744 /var/www/adminer
# enable adminer site
a2ensite adminer.conf
# desable the deafault apache2 site
a2dissite 000-default.conf

exec apachectl -D FOREGROUND