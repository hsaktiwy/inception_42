#!/bin/bash
# create the adminer index.php folder
mkdir /var/www/adminer
# install adminer
cd  /var/www/adminer
wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
# gave the apache permission on our folder
php -S 0.0.0.0:8181