#! /bin/sh

if [ ! -f "/wordpress/static-page/index.html" ]; then
  mkdir -p /wordpress/static-page 2>/dev/null
  cp ./tools/index.html /wordpress/static-page
fi
