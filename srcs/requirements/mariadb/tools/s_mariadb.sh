#!/bin/sh

# initializes the mariadb data directory and creates the system tables needed
mysql_install_db

# start mariadb in safe mode as a background process
# mysqld_safe : script that wraps ` mysqld` to handle some initialization tasks
# restart the server if crashes
mysqld_safe &

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS $MARIA_DATABS;"
mysql -e "CREATE USER IF NOT EXISTS '$MARIA_USER'@'%' IDENTIFIED BY '$USER_PWD';"
mysql -e "GRANT ALL PRIVILEGES ON $MARIA_DATABS.* TO '$MARIA_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

# Starts the MariaDB server again in safe mode.
mysqld_safe

#  this script is initial the database and create a user, grantes permissions and then restarts the server
