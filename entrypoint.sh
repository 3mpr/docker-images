#!/usr/bin/env bash

if [ ! "$(ls -A /home/www-data/app)" ]; then
    cd /home/www-data
    composer create-project --prefer-dist laravel/laravel tmp
    mv -v /home/www-data/tmp/* /home/www-data/app/
    mv -v /home/www-data/tmp/.* /home/www-data/app/ 2>/dev/null
    rmdir /home/www-data/tmp
    cd /home/www-data/app
    npm install
fi

cd /home/www-data/app
su www-data
php artisan serve --host 0.0.0.0
