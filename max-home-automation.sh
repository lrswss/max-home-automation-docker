#!/bin/sh
if [ -f /config/settings.txt ]; then
	max_home_automation --restore=/config/settings.txt
else
	max_home_automation --restore=/usr/local/etc/default-settings.txt
fi
