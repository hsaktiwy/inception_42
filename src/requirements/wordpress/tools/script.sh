wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html/

#  now let configurate our wp-configue
cd /var/www/html/wordpress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${SQL_DATABASE}/" wp-config.php
sed -i "s/username_here/${SQL_USER}/" wp-config.php
sed -i "s/password_here/${SQL_PASSWORD}/" wp-config.php

chown -R www-data:www-data /var/www/html/wordpress
service php7.4-fpm start
php7.4-fpm -F
service php7.4-fpm status > status.txt.txt