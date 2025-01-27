#!/bin/sh

if [ ! -d /var/lib/mysql/wordpress ]
then
	#CREATE DATABASE + ROOT USER
	echo "CREATE DATABASE $DATABASE_NAME;" > create_db_root.sql
	echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> create_db_root.sql
	echo "GRANT USAGE ON *.*  TO 'root'@'%';" >> create_db_root.sql
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> create_db_root.sql
	echo "FLUSH PRIVILEGES;" >> create_db_root.sql
	service mysql start && mysql -u root < /var/run/create_db_root.sql

	#CREATE WORDPRESS USER
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> create_db_user.sql
	echo "GRANT USAGE ON $DATABASE_NAME.*  TO '$MYSQL_USER'@'%';" >> create_db_user.sql
	echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> create_db_user.sql
	echo "FLUSH PRIVILEGES;" >> create_db_user.sql
	mysql -u root < /var/run/create_db_user.sql
else
	service mysql start
fi

service mysql stop

exec "$@"
