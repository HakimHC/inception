#! /bin/sh

mkdir /var/log/mysql

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

sleep 10

if [ ! -f /wordpress/wp-config.php ]; then
  wp core download --path=/wordpress

  wp config create --path=/wordpress --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST

  wp core install --url=$DOMAIN_NAME --title=Inception --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email="$ADMIN_EMAIL" --path=/wordpress

  wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --path=/wordpress

  wp theme install twentytwentytwo --activate --path=/wordpress
fi

echo "Available WordPress themes:"
wp theme list --path=/wordpress

php-fpm81 --nodaemonize
