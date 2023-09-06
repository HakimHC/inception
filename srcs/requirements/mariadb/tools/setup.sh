#! /bin/sh

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db

mysqld 
sleep 1

# mysql -u root -p$MYSQL_ROOT_PASSWORD -h localhost -P 3306 << EOF
# CREATE DATABASE $MYSQL_DATABASE;
# CREATE USER $MYSQL_USER@"'%'" IDENTIFIED BY "'$MYSQL_PASSWORD'";
# GRANT ALL PRIVILEGES ON wordpress.* TO $MYSQL_USER@"'%'";
# FLUSH PRIVILEGES;
# USE $MYSQL_DATABASE;
# DROP TABLE IF EXISTS Users;
# CREATE TABLE Users (name varchar(255));
# INSERT INTO Users VALUES ('hakim');
# INSERT INTO Users VALUES ('papito');
# EOF
# 
# echo ======== USER CREATION FINISHED BY NOW =========

#mysqladmin -u root -p$MYSQL_ROOT_PASSWORD -h localhost -P 3306 shutdown && mysqld
