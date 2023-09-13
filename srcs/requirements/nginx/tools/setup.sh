#! /bin/sh

openssl genpkey -algorithm RSA -out $PRIVKEY_PATH > /dev/null 2>&1

openssl req -new -x509 -key $PRIVKEY_PATH -out $CERT_PATH -days 365 > /dev/null 2>&1 << EOF 
$COUNTRY
$PROVINCE
$LOCALITY
$ORGANIZATION
$UNIT
$COMMON_NAME
$EMAIL_ADDR
EOF

touch /var/log/nginx/all.log

nginx -g "daemon off;"
