wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html/

#  now let configurate our wp-configue
sed -i "s/database_name_here/${SQL_DATABASE}/" wp-config.php
sed -i "s/username_here/${SQL_USER}/" wp-config.php
sed -i "s/password_here/${SQL_PASSWORD}/" wp-config.php

cd /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
systemctl restart php-fpm
