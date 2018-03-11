#!/usr/bin/env sh

WORKDIR="/usr/src/app"

init() {

  cd "${WORKDIR}" || exit 1

  [ -f requirements.txt ] && pip install -r requirements.txt

  python manage.py makemigrations
  python manage.py migrate
  python manage.py createsuperuser

  touch /.init

  cd - || exit 1

}

[ ! -f /.init ] && init

chown -R django:django "${WORKDIR}"
cd "${WORKDIR}" || exit 1
python manage.py runserver 0.0.0.0:8000
