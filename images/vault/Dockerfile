FROM vault:latest

ENV DUMB_INIT_VERSION 1.2.0

RUN apk add --update --no-cache --virtual .ssl libressl

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_${DUMB_INIT_VERSION}_amd64 \
 && chmod +x /usr/local/bin/dumb-init

RUN apk del .ssl

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD ["docker-entrypoint.sh"]
