#!/bin/sh

if [ -f /var/www/html/wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else

wp core download --allow-root

until nc -z -v -w30 mariadb 3306
do
  echo "Waiting for database connection..."
  sleep 5
done

wp config create --skip-check --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root --extra-php <<PHP
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );
define( 'WP_REDIS_PREFIX', 'my-moms-site' );
define( 'WP_REDIS_DATABASE', 0 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
PHP
#define( 'WP_REDIS_PASSWORD', getenv('REDIS_PASSWORD') );

wp core install --url="$DOMAIN_NAME" --title="nprljic" --admin_user=$WP_ADMIN_USERNAME --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USERNAME $WP_EMAIL --role=author --user_pass=$WP_PW --allow-root

wp plugin install redis-cache --activate --allow-root

#wp theme install twentytwentytwo --activate --allow-root

wp redis enable --allow-root

wp plugin update --all --allow-root

rm -f /var/www/html/wordpress/wp-config-sample.php

fi

exec "$@"