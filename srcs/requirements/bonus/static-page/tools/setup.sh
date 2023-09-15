#! /bin/sh

print_log() {
  echo "[ STATIC-PAGE ]: $1"
}

if [ ! -d "/wordpress/static-page" ]; then
  mkdir -p /wordpress/static-page 2>/dev/null
  print_log "static-page directory created."
fi

if [ ! -f "/wordpress/static-page/index.html" ]; then
  cp ./tools/index.html /wordpress/static-page
  print_log "index.html created."
fi
