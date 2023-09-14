#! /bin/sh

check_connection() {
  mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "SELECT 1;" 2>/dev/null
}

while true; do
  echo "Trying to connect to MYSQL..."
  if check_connection; then
    break
  fi
  sleep 1
done

grafana-server --config=/etc/grafana/grafana.ini --homepath=/usr/share/grafana
