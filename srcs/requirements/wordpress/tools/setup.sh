#! /bin/sh

apk add bash \
        curl \
        php-fpm \
        php-phar \
        php-mysqli \
        mariadb-client

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download

tail -f /dev/null
