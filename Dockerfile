ARG MEMCACHED_VER

FROM memcached:${MEMCACHED_VER}-alpine

ENV MEMCACHED_VER="${MEMCACHED_VER}"

USER root

RUN apk add --no-cache bash make

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

USER memcache

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "memcached" ]
