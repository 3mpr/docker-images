#!/usr/bin/env sh

HOME_DIR='/home/www-data'
APP_DIR="$HOME_DIR/app"
LOG_DIR="$APP_DIR/storage/logs"

echo -en "\nStarting laravel container...\n"

if [ ! "$(ls -A /home/www-data/app)" ]; then

    echo -en "\nLaravel installation not detected, installing...\n\n"

    cd $HOME_DIR
    composer create-project --prefer-dist laravel/laravel tmp

    for x in tmp/* tmp/.[!.]* tmp/..?*; do
        if [ -e "$x" ]; then mv -- "$x" $APP_DIR; fi
    done

    rmdir tmp

    cd $APP_DIR
    npm install
    sed -i 's/webpack-dev-server.js/webpack-dev-server.js --public/'\
     $APP_DIR/package.json

    chown -R www-data $APP_DIR
    echo -en "\nDone.\n"

fi

case $MIX_ENV in
    dev|watch|hot|production )
        ;;
    * )
        MIX_ENV='dev'
        ;;
esac

cd $APP_DIR
su www-data

npm run $MIX_ENV >> $LOG_DIR/runtime.log 2>&1 &
php artisan serve --host 0.0.0.0

exit $?
