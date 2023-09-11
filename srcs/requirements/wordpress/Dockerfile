FROM alpine:3.18

COPY . /app

WORKDIR /app

EXPOSE 9000

RUN chmod +x ./tools/setup.sh

RUN apk update && apk add bash \
                         curl \
                         php-fpm \
                         php-phar \
                         php-mysqli \
                         mariadb-client \
                         php-mbstring \
                         php-session

COPY ./conf/my.cnf /etc/my.cnf
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/php-fpm.conf /etc/php81/php-fpm.d/www.conf

CMD ["./tools/setup.sh"]
