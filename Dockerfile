FROM php:7-alpine
MAINTAINER Florian Indot <florian.indot@gmail.com>

# Alpine Dependencies & Update ----------------------------------------------- #
RUN sed -i 's/v3.4/v3.5/g' /etc/apk/repositories \
 && apk update \
 && apk add openssl nodejs
# \ -------------------------------------------------------------------------- #

# Composer Installation ------------------------------------------------------ #
ADD composer-setup.sh /tmp
RUN sh /tmp/composer-setup.sh \
 && rm /tmp/composer-setup.sh
# \ -------------------------------------------------------------------------- #

WORKDIR /home/www-data
EXPOSE 8000 8080
VOLUME /home/www-data/app

ADD entrypoint.sh /home/www-data/
ENTRYPOINT ["sh", "/home/www-data/entrypoint.sh"]
