FROM alpine:latest
MAINTAINER Florian Indot <florian.indot@gmail.com>

ENV DUMB_INIT_VERSION 1.2.0

RUN apk add --update --no-cache libressl

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_${DUMB_INIT_VERSION}_amd64
RUN chmod +x /usr/local/bin/dumb-init

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
