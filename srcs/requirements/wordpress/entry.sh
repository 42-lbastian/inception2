#!/bin/sh

if [ ! -e /var/www/html/index.php ]
then	
	wp core download --allow-root

	#WP-CONFIG
	sed -i "s/database_name_here/$DATABASE_NAME/g" /var/www/html/wp-config-sample.php
	sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wp-config-sample.php
	sed -i "s/localhost/mariadb/g" /var/www/html/wp-config-sample.php
	#echo "define('CONCATENATE_SCRIPTS', false);" >> /var/www/html/wp-config-sample.php
	mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

	chown -R www-data:www-data /var/www/html/*
	chmod -R 755 /var/www/html/*

	#CREATE SITE + USERS
	wp core install --url=https://lbastian.42.fr --title=$WEBSITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root

	wp user create $USER_NAME $USER_EMAIL --user_pass=$USER_PASSWORD --allow-root
fi

exec "$@"
