#!/bin/bash

MYSQL_PASSWORD=$(cat /run/secrets/db_password)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql > /dev/null

    service mariadb start

    sleep 5

    mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

    mariadb -u root -e "DROP USER IF EXISTS '${MYSQL_USER}'@'localhost';"

    mariadb -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

    mariadb -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    
    mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    
    mariadb -u root -e "FLUSH PRIVILEGES;"

    service mariadb stop
    sleep 2
fi

exec mysqld_safe


