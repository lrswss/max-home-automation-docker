FROM debian:bullseye-slim
MAINTAINER Lars Wessels <docker@bytebox.org>

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "deb [trusted=yes] http://www.dmitry-kazakov.de/distributions bullseye main" >> /etc/apt/sources.list

RUN apt-get -qq update --fix-missing; \
    apt-get -qq --yes upgrade; \
    apt-get -y --no-install-recommends install \
       ca-certificates apt-transport-https apt-utils \
       max-home-automation xvfb x11vnc xauth librsvg2-common

RUN apt-get -y --purge autoremove; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
COPY max-home-automation.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/max-home-automation.sh
COPY default-settings.txt /usr/local/etc/

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 5900
EXPOSE 1883
EXPOSE 80
CMD ["x11vnc"]
