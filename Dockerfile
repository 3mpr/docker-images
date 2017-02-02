FROM 3mpr/php
MAINTAINER Florian Indot <florian.indot@gmail.com>

# Alpine Dependencies & Update ----------------------------------------------- #
RUN sed -i 's/v3.4/v3.5/g' /etc/apk/repositories \
 && apk update \
 && apk add openssl nodejs
# \ -------------------------------------------------------------------------- #

# Composer Installation ------------------------------------------------------ #
ADD scripts/composer-setup.sh /tmp
RUN sh /tmp/composer-setup.sh \
 && rm /tmp/composer-setup.sh
# \ -------------------------------------------------------------------------- #

WORKDIR /home/www-data
EXPOSE 8000 8080
VOLUME /home/www-data/app

ADD scripts/entrypoint.sh /home/www-data/
ENTRYPOINT ["/usr/local/bin/dumb-init", "sh", "/home/www-data/entrypoint.sh"]
