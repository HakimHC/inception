#! /bin/sh

if [ ! -d "/wordpress/adminer" ]; then
	echo "Installing adminer..."
	mkdir /wordpress/adminer
	wget --quiet -O /wordpress/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
fi

echo "Adminer is ready!"
