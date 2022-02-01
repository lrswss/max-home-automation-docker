#!/usr/bin/env bash

PATH=$PATH:/usr/local/bin
XAUTHLOCALHOSTNAME=localhost
set -Eeo pipefail

if [ "$1" = "x11vnc" ]; then
	echo "max-home-automation.sh" > ~/.xinitrc
	chmod 755 ~/.xinitrc
	x11vnc -rfbport 5900 -create -forever -nopw -noxkb
else
	exec "$@"
fi
