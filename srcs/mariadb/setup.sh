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

cp ./my.cnf /etc/my.cnf

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db

mysqld

#thats all
