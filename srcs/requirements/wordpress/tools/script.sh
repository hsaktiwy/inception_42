#!/bin/bash

# install wp-client
    mkdir -p /var/www/wordpress
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

# install wordpress core
    cd /var/www/wordpress
    wp --allow-root core download

# loop over mariadb availability
    while ! nc -z -w2 mariadb 3306; do
        echo "waiting for mariadb to be properly running\n"
        sleep 2
    done

# configurate wordpress
    wp config create  --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306
    wp --allow-root core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp --allow-root user create $WP_USER_NAME $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWORD

# configurate redis
    wp --allow-root config set WP_REDIS_HOST 'redis' --type=constant
    wp --allow-root config set WP_REDIS_PORT 6379 --type=constant
    wp --allow-root config set WP_REDIS_PASSWORD $REDIS_PASS --type=constant

# installation redis plugin
    wp --allow-root plugin install redis-cache --activate
    wp --allow-root redis enable

# update php-fpm configuration
    sed -i "s#listen = /run/php/php7.4-fpm.sock#listen=wordpress:9000#" /etc/php/7.4/fpm/pool.d/www.conf

# additional details
    chown -R www-data:www-data /var/www/wordpress
    mkdir /run/php
php-fpm7.4 -F