FROM findot/baseimage:latest
MAINTAINER findot <florian.indot@gmail.com>

RUN set -ex \
    && apk add --update --no-cache tinc rsync \
    && mkdir /etc/tinc

COPY ["entrypoint.sh", "/"]
COPY ["etc/lightyears", "/tmp/lightyears"]

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc
VOLUME /var/log

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/entrypoint.sh"]
