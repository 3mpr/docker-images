FROM 3mpr/python:3-glibc
MAINTAINER oragelac <calegaroantoine@gmail.com>

WORKDIR /tmp

ENV DEPS="mysql"

RUN set -ex \
 && pip install --upgrade django \
 && apk add --update --no-cache mysql \
 && mkdir -p /usr/src/app && addgroup django \
 && adduser -D -g "" -G django -h /usr/src/app -s /sbin/nologin django \
 && chown -R django:django /usr/src/app

COPY ["entrypoint.sh", "/"]
VOLUME /usr/src/app

ENTRYPOINT ["dumb-init", "--"]
CMD ["/entrypoint.sh"]
