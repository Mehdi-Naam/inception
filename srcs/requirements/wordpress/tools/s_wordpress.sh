#!/bin/bash

# Download and set up WordPress
wp core download --allow-root
wp config create --dbname="$MARIA_DATABS" --dbuser="$MARIA_USER" --dbpass="$USER_PWD" --dbhost="$DB_HOST" --allow-root
wp core install --url="enaam.42.fr" --title="Welcom Inception" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --skip-email --allow-root
wp config set FS_METHOD direct --allow-root
# Create an additional WordPress user
wp user create "$WP_USER" "$WP_EMAIL" --role=author --user_pass="$WP_PASSWORD"  --allow-root

# Start PHP-FPM in the foreground
/usr/sbin/php-fpm7.4 -F
