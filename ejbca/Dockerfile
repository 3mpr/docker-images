FROM 3mpr/java:latest
MAINTAINER Florian Indot <florian.indot@gmail.com>

ENV DEPS \
    wget \
    ca-certificates

RUN apk add --update --no-cache --virtual deps ${DEPS}

RUN set -xe \
 && cd /tmp \
 && wget https://sourceforge.net/projects/ejbca/files/ejbca6/ejbca_6_5_0/ejbca_ce_6_5_0_4.zip -O /tmp/ejbca.zip \
 && unzip /tmp/ejbca.zip -d /tmp \
 && mv tmp/ejbca_ce_6_5_0_4 /etc/ejbca \
 && rm /tmp/ejbca_ce_6_5_0_4.zip

RUN apk del deps

ENTRYPOINT ["/usr/local/bin/dumb-init", "sh", "/etc/ejbca/bin/djbca.sh"]
