#!/usr/bin/env bash

PATH=$PATH:/usr/local/bin
XAUTHLOCALHOSTNAME=localhost
set -Eeo pipefail

if [ "$1" = "x11vnc" ]; then
	echo -n "Starting max_home_automation on virtual framebuffer "
	xvfb-run -a -n 10 -f /tmp/xvfb.xauth max-home-automation.sh &
	sleep 2
	echo "Starting x11vnc on port 5900..."
	x11vnc -rfbport 5900 -display :10 -forever -nopw -noxkb -auth /tmp/xvfb.xauth >/dev/null 2>&1
else
	exec "$@"
fi
