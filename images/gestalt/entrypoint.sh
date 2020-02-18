#!/usr/bin/env sh


NGINX_DIR="/etc/nginx"
GESTALT_HOST_FILE="gestalt.conf"
GESTALT_APP="/usr/bin/gestaltd"


function https {
  if [ "${HTTPS}" == "true" ]; then
    return 0
  fi

  return 1
}

function initialized {
  if [ -f /.initialized ]; then
    return 0
  fi

  return 1
}

function init {
  echo "Initializing Gestalt..."
  if https; then
    GESTALT_HOST_FILE="${NGINX_DIR}/disabled/gestalt_tls.conf"
  fi

  GESTALT_CONF="${NGINX_DIR}/disabled/${GESTALT_HOST_FILE}"

  touch /var/log/nginx/uwsgi.log && chown gestalt:gestalt /var/log/nginx/uwsgi.log

  touch /.initialized
  echo "Done."
}

function nginx_dir {
  if [ $(ls ${NGINX_DIR}) ]; then
    return 0
  fi

  return 1
}


echo "Starting gestalt daemon..."
su-exec gestalt /usr/local/bin/gestaltd
sleep 3 # Sleep for 3 seconds for the gestalt socket to appear
chmod 777 /run/gestalt/gestalt.sock
echo "Done."

nginx -g 'daemon off;'
