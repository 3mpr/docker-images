#!/usr/bin/env bash

[ ! -d www ] && mkdir www && sudo chmod a+w www

docker run -itd --name laravel \
 -p 8000:8000 -p 8080:8080 \
 -v "${PWD}/www":"/home/www-data/app" \
 -e MIX_ENV='hot' \
 findot/laravel:5.4

exit $?
