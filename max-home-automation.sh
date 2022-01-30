#!/bin/sh
if [ -f /config/settings.txt ]; then
	echo "using /config/settings.txt..."
	max_home_automation --restore=/config/settings.txt
else
	echo "using default settings..."
	max_home_automation --restore=/usr/local/etc/default-settings.txt
fi
