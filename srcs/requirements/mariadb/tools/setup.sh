#! /bin/sh

function add_query_line {
  echo "$1" >> "$MYSQL_INIT_FILE"
}

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

mysql_install_db

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
  rm -f "$MYSQL_INIT_FILE"
  add_query_line "CREATE DATABASE $MYSQL_DATABASE;"
  add_query_line "CREATE USER $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
  add_query_line "CREATE USER $MYSQL_USER@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
  add_query_line "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'%' WITH GRANT OPTION;"
  add_query_line "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'localhost' WITH GRANT OPTION;"
  add_query_line "FLUSH PRIVILEGES;"
fi

mysqld --init-file=$MYSQL_INIT_FILE
