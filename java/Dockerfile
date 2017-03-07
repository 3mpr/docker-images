FROM 3mpr/baseimage:0.1
MAINTAINER Florian Indot <florian.indot@gmail.com>

ENV JAVA_MAJOR_VERSION="8" \
    JAVA_MINOR_VERSION="92" \
    JAVA_VERSION_BUILD="14" \
    JAVA_PACKAGE="server-jre" \
    JAVA_HOME="/jre" \
    PATH="${PATH}:/jre/bin"
ENV DEPS \
    wget \
    ca-certificates

RUN apk add --update --no-cache --virtual deps ${DEPS}

RUN  set -x \
 && mkdir /jre \
 && wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_MINOR_VERSION}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_MAJOR_VERSION}u${JAVA_MINOR_VERSION}-linux-x64.tar.gz -O - \
 | gunzip -c - | tar xf - -C /jre --strip-components 1

RUN apk del deps

ENTRYPOINT ["/usr/local/bin/dumb-init", "sh"]
