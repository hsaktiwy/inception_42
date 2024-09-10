#!/bin/bash

# start our php7.4fpm service
    service php7.4-fpm start
# lets create a wordpress forlder /var/www/wordpress and access it location
    mkdir -p /var/www/wordpress
# download the wp(CLI) this will make our wordpress installation and configuration as easy as possible
        wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    # configurate our wordpress wp-config
            # gave our wp-cli.phar execute rigths
                chmod +x wp-cli.phar
            # let move the wp-cli.phar to our usr/local/bin with new name like wp
                mv wp-cli.phar /usr/local/bin/wp
# lets access the location /var/www/wordpress
    cd /var/www/wordpress
# install our wordpress core in /var/www/wordpress (we will add --allow-rrot flag in all our wp command flag to make the command run with root )
    wp --allow-root core download
# create our wp-config file
    wp config create  --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'
# create a our user admin (OUR FIRST USER EVER)
    wp --allow-root core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
# create a our second user
    wp --allow-root user create $WP_USER_NAME $WP_USER_EMAIL --role=$WP_USER_ROLE --user_pass=$WP_USER_PASSWORD
# we will modife the wp-confige to sweet our redis we need to identife the redis host port and connection type tcp in this case
    wp --allow-root config set WP_REDIS_HOST 'redis' --type=constant
    wp --allow-root config set WP_REDIS_PORT 6379 --type=constant
    wp --allow-root config set WP_REDIS_PASSWORD $REDIS_PASS --type=constant
# install redis cache plugin
    wp --allow-root plugin install redis-cache --activate
#this this will allow our redis to work on our wordpress
    chown -R www-data:www-data /var/www/wordpress
#this is for activating our redis cache object from the script and not manulay
    wp --allow-root redis enable
# configurate our www.conf
    # change the listen value to be able to receive it requests from wordpress one port 9000  
        sed -i "s#listen = /run/php/php7.4-fpm.sock#listen=wordpress:9000#" /etc/php/7.4/fpm/pool.d/www.conf
    # this will not gave the php-fpm to clear the envirement variables, (as it was used to Prevents arbitrary environment variables from reaching FPM worker processes)
# stop our php7.4fpm service to run  php-fpm7.4 -F
    service php7.4-fpm stop
# run our php service in the forground
    php-fpm7.4 -F