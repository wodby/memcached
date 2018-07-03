ARG BASE_IMAGE_TAG

FROM memcached:${BASE_IMAGE_TAG}

ARG MEMCACHED_VER

ENV MEMCACHED_VER="${MEMCACHED_VER}"

USER root

RUN apk add --no-cache bash make

COPY docker-entrypoint.sh /
COPY bin /usr/local/bin/

USER memcache

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "memcached" ]
