ARG MEMCACHED_VER
ARG ALPINE_VER

FROM wodby/base-memcached:${MEMCACHED_VER}-alpine${ALPINE_VER}

ENV MEMCACHED_VER="${MEMCACHED_VER}"

USER root

RUN apk add --no-cache bash make

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

USER memcache

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "memcached" ]
