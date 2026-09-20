# check=skip=InvalidDefaultArgInFrom

# The Makefile supplies the required digest-pinned BASE_IMAGE argument.
ARG MEMCACHED_VER

ARG BASE_IMAGE
FROM ${BASE_IMAGE}
ARG MEMCACHED_VER

ENV MEMCACHED_VER="${MEMCACHED_VER}"

USER root

# Upgrade inherited packages even when their existing versions satisfy dependencies.
RUN set -ex; \
    apk upgrade --no-cache; \
    apk add --no-cache bash make

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

USER memcache

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "memcached" ]
