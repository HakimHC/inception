#! /bin/sh

apk update
apk add mariadb mariadb-client

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db

mysqld &
sleep 1

mysql -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER "'$MYSQL_USER'"@'localhost' IDENTIFIED BY "'$MYSQL_PASSWORD'";
GRANT ALL PRIVILEGES ON wordpress.* TO "'$MYSQL_USER'"@'localhost';
FLUSH PRIVILEGES;
USE $MYSQL_DATABASE;
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (name varchar(255));
INSERT INTO Users VALUES ('hakim');
INSERT INTO Users VALUES ('papito');
EXIT;
EOF

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown && mysqld
