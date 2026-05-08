#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/db_password.txt)


mysqld_safe &

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -e "CREATE USER IF NOT EXISTS 'osamet'@'%' IDENTIFIED BY '1234';"
myqsl -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'osamet'@'%';"

#Appli changement
mysql -e "FLUSH PRIVILEGES;"

service mariadb stop

exec mysqld_safe

