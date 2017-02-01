#!/usr/bin/env sh

cd /home/www-data

if [ ! "$(ls -A /home/www-data/app)" ]; then

    composer create-project --prefer-dist laravel/laravel tmp

    for x in tmp/* tmp/.[!.]* tmp/..?*; do
        if [ -e "$x" ]; then mv -- "$x" app/; fi
    done

    rmdir tmp

    cd app
    npm install

fi

cd /home/www-data/app
su www-data
php artisan serve --host 0.0.0.0

exit $?
