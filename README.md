# Memcached Docker Container Image

[![Build Status](https://github.com/wodby/memcached/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/memcached/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/memcached.svg)](https://hub.docker.com/r/wodby/memcached)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/memcached.svg)](https://hub.docker.com/r/wodby/memcached)

## Docker Images

❗For better reliability we release images with stability tags (`wodby/memcached:1-X.X.X`) which correspond to [git tags](https://github.com/wodby/memcached/releases). We strongly recommend using images only with stability tags. 

Overview:

- All images based on Alpine Linux
- Base image: [_/memcached](https://hub.docker.com/_/memcached)
- [GitHub actions builds](https://github.com/wodby/memcached/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/memcached)

[_(Dockerfile)_]: https://github.com/wodby/memcached/tree/master/Dockerfile

Supported tags and respective `Dockerfile` links:

- `1`, `latest` [_(Dockerfile)_]

## Orchestration Actions

Usage:
```
make COMMAND [params ...]
 
commands:
    check-ready host max_try wait_seconds delay_seconds
    flushall host
    
default params values:
    host localhost
    max_try 1
    wait_seconds 1
    delay_seconds 0
```
