#!/usr/bin/env sh

set -ex

WORKDIR="/usr/src/app/web2py"
TMPDIR="/tmp"

app_init() {
  cd "${WORKDIR}" || exit 1
  
  [ -f requirements.txt ] && pip install -r requirements.txt
  touch ${TMPDIR}/.app_init

  cd - || exit 1
}

if [ ! -f ${TMPDIR}/.app_init ]; then
  app_init
fi

#chown -R web2py:web2py "${WORKDIR}"
cd "${WORKDIR}" || exit 1

python web2py.py -a waffles4love -l /var/log/web2py/web2py.log -i 0.0.0.0
