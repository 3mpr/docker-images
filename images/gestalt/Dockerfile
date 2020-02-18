FROM 3mpr/python:3

ENV BUILD_DEPS="git alpine-sdk python-dev linux-headers"
ENV DEPS="nginx rsync shadow su-exec nginx-mod-stream"

COPY ["gestalt", "/usr/src/gestalt"]
COPY ["gestaltd", "/usr/local/bin/"]


RUN apk add --update --no-cache --virtual .build-deps ${BUILD_DEPS} \
 && apk add --update ${DEPS} \
 && pip install --upgrade flask uwsgi

RUN addgroup gestalt \
 && adduser -G gestalt -h /usr/src/gestalt -S -D gestalt \
 && chown -R gestalt:gestalt /usr/src/gestalt \
 && usermod -aG gestalt nginx

RUN set -ex \
 && mkdir /run/gestalt \
 && chown -R gestalt:gestalt /etc/nginx \
 && chown -R gestalt:gestalt /run/gestalt \
 && chown -R gestalt:gestalt /usr/src/gestalt \
 && chown -R gestalt:nginx /var/log/nginx \
 && mkdir /run/nginx && chown -R nginx:nginx /run/nginx \
 && mkdir -p /etc/nginx/disabled && chown -R gestalt:nginx /etc/nginx/disabled

COPY ["gestalt.conf", "gestalt_ssl.conf", "/etc/nginx/disabled/"]

RUN set -ex \
 && mkdir -p /tmp/nginx_backup && rsync -r /etc/nginx/* /tmp/nginx_backup \
 && chown -R gestalt:nginx /tmp/nginx_backup

RUN apk del .build-deps


COPY ["entrypoint.sh", "/"]
VOLUME /etc/nginx
VOLUME /var/log/nginx

EXPOSE 80 443

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/entrypoint.sh"]
