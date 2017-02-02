#!/usr/bin/env sh

cd /home/www-data

echo -en "\nStarting laravel container...\n"

if [ ! "$(ls -A /home/www-data/app)" ]; then

    echo -en "\nLaravel installation not detected, installing...\n"

    composer create-project --prefer-dist laravel/laravel tmp

    for x in tmp/* tmp/.[!.]* tmp/..?*; do
        if [ -e "$x" ]; then mv -- "$x" app/; fi
    done

    rmdir tmp

    cd app
    npm install

    echo -en "\nDone.\n"

fi

cd /home/www-data/app
su www-data
php artisan serve --host 0.0.0.0

exit $?
