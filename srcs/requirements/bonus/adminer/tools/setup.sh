#! /bin/sh

print_log() {
  echo "[ ADMINER ]: $1"
}

if [ ! -d "/wordpress/adminer" ]; then
	print_log "Installing adminer..."
	mkdir /wordpress/adminer
	wget --quiet -O /wordpress/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
fi

print_log "Adminer is ready!"
