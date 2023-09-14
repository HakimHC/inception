#! /bin/sh

if [ ! -d "/wordpress/static-page" ]; then
  mkdir -p /wordpress/static-page 2>/dev/null
  echo "static-page directory created!"
fi

if [ ! -f "/wordpress/static-page/index.html" ]; then
  cp ./tools/index.html /wordpress/static-page
fi
