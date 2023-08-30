#! /bin/sh

#install mariadb
apk update
apk add mariadb mariadb-client

#install vim for debugging pursoses
apk add vim

#i cant stand rl history with arrows (also i use a shell for now for debugging pursoses for now)
echo "set -o vi" > /.bashrc
source /.bashrc

#comments are quite fun tbh

#now lets go for the so called "chicha"

cp ./conf /etc/my.cnf

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db

mysqld &
sleep 1

mysql -u root -p$MYSQL_ROOT_PASSWORD << EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'yourpassword';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
FLUSH PRIVILEGES;
USE wordpress;
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (name varchar(255));
INSERT INTO Users VALUES ('hakim');
INSERT INTO Users VALUES ('papito');
EXIT;
EOF

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown && mysqld
