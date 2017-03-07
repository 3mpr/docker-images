FROM golang:1.7-alpine
MAINTAINER Florian Indot <florian.indot@gmail.com>

ENV DUMB_INIT_VERSION 1.2.0

RUN apk update \
 && apk upgrade \
 && apk add --update --no-cache --virtual .ssl openssl

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_${DUMB_INIT_VERSION}_amd64 \
 && chmod +x /usr/local/bin/dumb-init

RUN apk del .ssl

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
