#! /bin/sh

print_log() {
  echo "[ NGINX ]: $1"
}

openssl genpkey -algorithm RSA -out $PRIVKEY_PATH > /dev/null 2>&1

print_log "Private key generated."

openssl req -new -x509 -key $PRIVKEY_PATH -out $CERT_PATH -days 365 > /dev/null 2>&1 << EOF 
$COUNTRY
$PROVINCE
$LOCALITY
$ORGANIZATION
$UNIT
$COMMON_NAME
$EMAIL_ADDR
EOF

print_log "TLS certificate generated."

print_log "Starting webserver..."

nginx
