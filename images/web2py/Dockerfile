FROM findot/python:2.7-glibc
MAINTAINER findot <florian.indot@gmail.com>

WORKDIR /tmp

ENV WEB2PY_ENDPOINT="https://mdipierro.pythonanywhere.com/examples/static/web2py_src.zip" \
    DEPS="libressl" \
    CDEPS="jpeg-dev zlib-dev musl-dev" \
    PYDEPS="reportlab requests"

COPY ["entrypoint.sh", "/"]

RUN set -ex \
    && apk add --update --no-cache ${DEPS} gcc ${CDEPS} \
    && pip install ${PYDEPS} \
    && wget ${WEB2PY_ENDPOINT} \
    && unzip web2py_src.zip \
    && mkdir -p /usrc/src/app \
    && mkdir -p /var/log/web2py \
    && addgroup web2py \
    && adduser -g "" -G web2py -h /usr/src/app -D web2py \
    && chown web2py:web2py /entrypoint.sh \
    && chown -R web2py:web2py /var/log/web2py \
    && chmod u+x /entrypoint.sh \
    && mv /tmp/web2py /usr/src/app/ \
    && chown -R web2py:web2py /usr/src/app/web2py \
    && apk del gcc

VOLUME /usr/src/app/web2py/applications
VOLUME /var/log/web2py

USER web2py

ENTRYPOINT ["dumb-init", "--"]
CMD ["/entrypoint.sh"]

