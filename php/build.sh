#!/usr/bin/env sh

[ -f Dockerfile ] && rm Dockerfile

git clone https://github.com/docker-library/php.git
mv php/7.1/alpine/* .
rm -rf php

# Updates base Docker file to use my baseimage and replaces alpine:3.4 openssl
# dependency with libressl, used since 3.5
sed -i 's/FROM alpine:[0-9]\?.[0-9]\?/FROM 3mpr\/baseimage:latest/' Dockerfile
sed -i 's/openssl/libressl/g' Dockerfile
sed -i 's/--with-libressl/--with-openssl/g' Dockerfile # Correction of the last sed
sed -i 's/#!\/bin\/sh/#!\/usr\/local\/bin\/dumb-init sh/' docker-php-entrypoint

docker build -f Dockerfile -t 3mpr/php .
EXIT_CODE=$?

rm docker-php-*

exit $EXIT_CODE
