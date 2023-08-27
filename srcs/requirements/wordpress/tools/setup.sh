#! /bin/sh

#install vim for debugging pursoses
apk add vim

#i cant stand rl history with arrows (also i use a shell for now for debugging pursoses for now)
echo "set -o vi" > /.bashrc
source /.bashrc

apk add bash \
        curl \
        wget

mkdir -p /srv/www && cd $_
# chown www-data: /srv/www
curl -O https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
rm -rf latest.tar.gz

tail -f /dev/null
