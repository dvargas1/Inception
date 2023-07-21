#!/bin/bash

if [ ! -f "/wp/wp-config.php" ]; then
echo "switch to /wp"
cd /wp

echo "Installing and starting WordPress"
		wget -q -O - https://wordpress.org/latest.tar.gz | tar -xz -C /wp --strip-components=1
		chmod -R +rwx /wp

		wp --path=/wp --allow-root config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="mariadb":"3306" --dbprefix='wp_'
		wp --path=/wp --allow-root core install --url="$DOMAIN_NAME" --title="$WORDPRESS_SITE_NAME" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"
		wp --path=/wp --allow-root user create "$WP_USER_EDITOR" "$WP_EMAIL_EDITOR" --role='editor' --user_pass="$WP_PASSWORD_EDITOr"
		wp --path=/wp --allow-root user create "$WP_USER" "$WP_EMAIL" --role='subscriber' --user_pass="$WP_PASSWORD"

echo "Starting redis plugin"
		wp plugin install redis-cache --activate --allow-root
		wp --path=/wp --allow-root config set WP_CACHE_KEY_SALT "$DOMAIN_NAME"
		wp --path=/wp --allow-root config set WP_CACHE "true" --raw
		wp --path=/wp --allow-root config set WP_REDIS_HOST "redis"
		wp redis enable --allow-root
fi

chmod -R 777 /wp
mkdir -p /run/php/
chown www-data:www-data /run/php/

exec php-fpm7.4 -F