FROM 3mpr/baseimage:0.1
MAINTAINER Florian Indot <florian.indot@gmail.com>

ARG EASYRSA_VERSION=3.0.1

RUN apk add --update --no-cache ca-certificates openssl

RUN set -x \
 && addgroup -S pki \
 && adduser -D -S -G pki pki

RUN cd /tmp \
 && wget https://github.com/OpenVPN/easy-rsa/releases/download/3.0.1/EasyRSA-${EASYRSA_VERSION}.tgz \
 && tar xf EasyRSA-3.0.1.tgz \
 && rm EasyRSA-3.0.1.tgz

RUN chown -R pki:pki /tmp/EasyRSA-3.0.1 \
 && chmod 754 /tmp/EasyRSA-3.0.1

VOLUME ["/tmp/EasyRSA-3.0.1/pki"]
WORKDIR /tmp/EasyRSA-3.0.1
USER pki

ENTRYPOINT ["/usr/local/bin/dumb-init", "sh"]
