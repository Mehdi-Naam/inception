#!/bin/bash

# Download and set up WordPress
wp core download --allow-root
wp config create --dbname="$MARIA_DATABS" --dbuser="$MARIA_USER" --dbpass="$USER_PWD" --dbhost="$DB_HOST" --allow-root
wp core install --url="$DOMAINE_NAME" --title="$DOMAINE_NAME" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL"  --allow-root

# Create an additional WordPress user
wp user create "$WP_USER" "$WP_EMAIL" --role=author --user_pass="$WP_PASSWORD"  --allow-root

# Start PHP-FPM in the foreground
/usr/sbin/php-fpm7.4 -F



#       SCRIPT - EXPLAINATION
##  wp core download --allow-root :
    # wp : cmdLine tool for managing WordPress Installations

    # core download: DownLoads the WordPress core files into
    #                current directory

    # --allow-root : this option Allows the command to be run
    #                as root user, since Docker Containers
    #                often run as root, this flag is necessary
    #                to avoid permission issues

    # this cmd Line outcome the Latest WordPress files to
    # `/var/www/html` directory

## wp config create --dbname="$MARIA_DATABS" --dbuser="$USER_NAME" --dbpass="$DB_PWD" --dbhost="$DB_HOST" --allow-root
    # wp config create : genereate a wp-config.php file, which is essential for WordPress to connect to the database

    # --dbname : spc the database name using the env variable
    #  --> the same for other options

    # --allow-root : allows execution as root

    # The OUTCOME Is creates a wp-config.php file that includes your database
    # connection details, this file is crucial for WordPress to communicate With MariaDB


## wp core install --url="$DOMAIN_NAME" --title="$DOMAINE_NAME" --admin_password="$WP_ADM_PWD" --admin_email="$WP_ADM_ML" --allow-root
    # wp core install : Installs WordPress with the provided site details

    # --url : sets the site's URL to the Value of DOMAIN_NAME
    # ...

    # the OUTCOME is complete the installation of the site with the provided setting
    # with user and user_password


## wp user create "$WP_USER" "WP_EMAIL" --role=author --user_pass="$WP_PASSOWRD" --allow-root
    # wp user create : Creates a new WordPress user account

    # "$WP_USER" :: 'firstParam' : the username for the new user
    # "$WP_EMAIL":: 'secondPram' : the email associated with the new user

    # --role=author : Assigns the "author" role to the new user
    #                 this role allow the user to write and publich posts

    # --user_pass="WP_PASSWord": sets the password the new user
    # --allow-root: allows the command to run as root

    # OUTCOME Is add an additional user to WordPress 
    # Which is useful for content management or testing different user Roles

## /usr/sbin/php-fpm7.4 -F
    # /path/php-fpm7.4 : Launches the PHP FastCGI Process Manager, which handles PHP
    # requests for the web server

    # ` -F ` : run it on the ForeGround

    #  OUTCOME Is start the PHP-FPM allowing WordPress to process PHP SCRIPTs

