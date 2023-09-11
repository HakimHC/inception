#! /bin/sh

function query {
  mysql -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "$1"
}

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db

mysqld&
sleep 2
#rc-service mariadb start

check_database_query="SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$MYSQL_DATABASE';"
result=$(mysql -u root -p$MYSQL_ROOT_PASSWORD -h localhost -e "$check_database_query")

echo hasta aqui

if [ -z "$result" ]; then
  query "CREATE DATABASE $MYSQL_DATABASE;"
  query "CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
  query "CREATE USER $MYSQL_USER@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
  query "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' WITH GRANT OPTION;"
  query "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'localhost' WITH GRANT OPTION;"
  query "FLUSH PRIVILEGES;"
  echo done
else
  echo 42
fi

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD -h localhost shutdown && mysqld
