#! /bin/sh

if [ ! -d "/wordpress/adminer" ]; then
	mkdir /wordpress/adminer
	wget -O /wordpress/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
fi
