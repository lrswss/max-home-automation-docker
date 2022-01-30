# max-home-automation-docker

Files to create and run a Docker image with [max_home_automation](http://www.dmitry-kazakov.de/ada/max_home_automation.htm)
based on debian-bullseye-slim. It's is a GTK+ application written by Dmitry A. Kazakov to manage an
[eQ-3 MAX! cube](https://www.eq-3.de/produkte/homematic/detail/bc-lgw-o-tw.html) and basically replaces the no
longer maintained [orginal ELV MAX! software](https://www.max-portal.elv.de/login.jsp) adding lots of useful features.
It will run headless using a virtual X11 framebuffer ([xvfb](https://linux.die.net/man/1/xvfb)) and can be configured
using [VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing) on port 5900. The container also exposes ports
1883 and 8080 to control the cube and all connected thermostats using [MQTT messages](https://en.wikipedia.org/wiki/MQTT)
or HTTP REST commands. It can thus be applied as bridge between home automation software such as
[Home Assistant](https://www.home-assistant.io/) and the MAX! devices. A settings file for max_home_automation can
be placed in the directory `config`. To get this great piece of software up and running just clone this repository,
run `docker-compose start` and point your VNC client to port 5900.
