# Generic Memcached docker image

[![Build Status](https://travis-ci.org/wodby/memcached.svg?branch=master)](https://travis-ci.org/wodby/memcached)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/memcached.svg)](https://hub.docker.com/r/wodby/memcached)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/memcached.svg)](https://hub.docker.com/r/wodby/memcached)

[![Wodby Slack](https://www.google.com/s2/favicons?domain=www.slack.com) Join us on Slack](https://slack.wodby.com/)

## Supported tags and respective `Dockerfile` links:

- [`1.4`, `latest` (*1.4/Dockerfile*)](https://github.com/wodby/memcached/tree/master/1.4/Dockerfile)

## Actions

Usage:
```
make COMMAND [params ...]
 
commands:
    check-ready host=<memcached> max_try=<8> wait_seconds=<5>
    flushall host=<memcached>  
    
default params values:
    host localhost
    max_try 30
    wait_seconds 1
```

Examples:

```bash
# Check if Memcached is ready
docker exec -ti [ID] make check-ready -f /usr/local/bin/actions.mk

# Flush all cache
docker exec -ti [ID] make flushall host=memcached -f /usr/local/bin/actions.mk
```

You can skip -f option if you use run instead of exec. 

## Using in Production

Deploy Memcached container to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com).
