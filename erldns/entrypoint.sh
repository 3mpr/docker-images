#!/usr/bin/env sh

CONF_PATH="/tmp/erl-dns/conf"

if [ ! -d ${CONF_PATH} ]; then
    mkdir -p ${CONF_PATH}/priv
    mv /tmp/erl-dns/erldns.config.example ${CONF_PATH}/
    cp ${CONF_PATH}/erldns.config.example ${CONF_PATH}/erldns.config
    cp -r priv ${CONF_PATH}/
fi

cd /tmp/erl-dns/
erl -config ${CONF_PATH}/erldns.config -pa ebin deps/**/ebin -s erldns

inets:start().
crypto:start().
lager:start().
application:start(base32).
application:start(dns).
application:start(jsx).
ssl:start().
mnesia:start().
