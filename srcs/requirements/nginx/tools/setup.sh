#! /bin/sh

openssl genpkey -algorithm RSA -out $PRIVKEY_PATH

openssl req -new -x509 -key $PRIVKEY_PATH -out $CERT_PATH -days 365 << EOF
$COUNTRY
$PROVINCE
$LOCALITY
$ORGANIZATION
$UNIT
$COMMON_NAME
$EMAIL_ADDR
EOF

nginx -g "daemon off;"&


touch /var/log/nginx/all.log
tail -f /var/log/nginx/all.log
