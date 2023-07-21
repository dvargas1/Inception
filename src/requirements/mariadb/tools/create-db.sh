#!/bin/sh

if [ ! -d "/var/lib/mysql/$SQL_DATABASE" ]; then
	mysqld_safe --datadir=/var/lib/mysql&
	sleep 1

mysql -e "CREATE DATABASE $SQL_DATABASE;"
mysql -e "CREATE USER $SQL_USER@'%' IDENTIFIED BY '$SQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown
fi

exec mysqld_safe --datadir=/var/lib/mysql