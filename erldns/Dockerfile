FROM 3mpr/baseimage:0.1
MAINTAINER Florian Indot <florian.indot@gmail.com>

WORKDIR /tmp

ENV BUILD_DEPS \
    git \
    make

ENV ERL_DEPS \
    erlang \
    erlang-kernel \
    erlang-compiler \
    erlang-dev \
    erlang-inets \
    erlang-parsetools \
    erlang-asn1 \
    erlang-crypto \
    erlang-ssl \
    erlang-public-key \
    erlang-erl-interface \
    erlang-syntax-tools \
    erlang-mnesia \
    erlang-observer

RUN set -x \
 && addgroup -S named \
 && adduser -D -S -G named named

RUN apk add --update --no-cache --virtual build_deps $BUILD_DEPS \
 && apk add --update --no-cache $ERL_DEPS

RUN git clone https://github.com/aetrion/erl-dns.git \
 && cd erl-dns \
 && sh build.sh

RUN apk del build_deps

USER named
WORKDIR /tmp/erl-dns
VOLUME ["/tmp/erl-dns/conf"]
EXPOSE 8053

ADD ["entrypoint.sh", "/tmp/erl-dns/"]
ENTRYPOINT ["sh", "entrypoint.sh"]
