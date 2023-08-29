#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
sleep 10
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "/var/www/html/wp-config.php" ]; then
    mkdir -p /var/www/html

    wp core download  --path="/var/www/html" --allow-root

    cd /var/www/html

    wp config create --dbname=$MARIADB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --path="/var/www/html" --allow-root

    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/html" --allow-root
   
    wp user create $WP_USR1 $WP_USR1_EMAIL --role=author --user_pass=$WP_USR1_PWD --path="/var/www/html" --allow-root
   
fi

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf



mkdir -p /run/php
/usr/sbin/php-fpm7.4 --nodaemonize
