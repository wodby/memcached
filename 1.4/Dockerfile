FROM memcached:1.4-alpine

USER root

RUN apk add --no-cache bash make

COPY docker-entrypoint.sh /
COPY actions /usr/local/bin/

USER memcache

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "memcached" ]
