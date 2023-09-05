#! /bin/sh

mkdir /var/log/mysql

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/wordpress


wp config create --path=/wordpress --dbname=$MYSQL_DATABASE --dbuser=root --dbpass=dufus --dbhost=mariadb

#wp core install --url=example.com --title=Example --admin_user=supervisor --admin_password=strongpassword --admin_email=info@example.com --path=/wordpress

tail -f /dev/null
