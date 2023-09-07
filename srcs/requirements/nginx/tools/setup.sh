#! /bin/sh

openssl genpkey -algorithm RSA -out /etc/nginx/ssl/private_key.pem

openssl req -new -x509 -key /etc/nginx/ssl/private_key.pem -out /etc/nginx/ssl/cert.pem -days 365 << EOF
$COUNTRY
$PROVINCE
$LOCALITY
$ORGANIZATION
$UNIT
$COMMON_NAME
$EMAIL_ADDR
EOF

nginx -g "daemon off;"&


touch /var/log/nginx/error.log
tail -f /var/log/nginx/error.log
