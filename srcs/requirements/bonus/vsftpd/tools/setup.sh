#! /bin/sh

check_user() {
  id "$1"
}

echo "Starting FTP server..."


if ! check_user "$VSFTPD_USER"; then
adduser -h $WORDPRESS_DIR hakim << EOF
$VSFTPD_PASSWORD
$VSFTPD_PASSWORD
EOF
fi

echo "$VSFTPD_USER"|tee -a /etc/vsftpd.userlist > /dev/null

chown -R nobody:nogroup $WORDPRESS_DIR
chown -R "$VSFTPD_USER":"$VSFTPD_USER" $WORDPRESS_DIR

vsftpd
