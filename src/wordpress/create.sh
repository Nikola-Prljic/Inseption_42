#!/bin/sh

if [ -f /var/www/html/wp-config.php ]
then
	echo "wordpress already downloaded"
else

until nc -z -v -w30 mariadb 3306
do
  echo "Waiting for database connection..."
  sleep 5
done

wp core download

wp config create --skip-check --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME

wp core install --url="localhost" --title="nprljic" --admin_user="nprljic" --admin_password="ktmsx125" --admin_email="nik.7377@gmail.com"

rm -f wp-config-sample.php

fi

exec "$@"