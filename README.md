# Memcached Docker Container Image

[![Build Status](https://github.com/wodby/memcached/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/memcached/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/memcached.svg)](https://hub.docker.com/r/wodby/memcached)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/memcached.svg)](https://hub.docker.com/r/wodby/memcached)

## Docker Images

Use image revision tags such as `wodby/memcached:1-rN` to select a Wodby image revision.
Major and minor tags use the repository release number. Full-version tags such as
`wodby/memcached:1.6.45-r0` start at `r0` for each exact upstream version.
Every published versioned revision tag has a matching annotated Git tag pointing to its release commit.
Existing tags remain available after support for their major or minor version ends.
See [release tags](https://github.com/wodby/memcached/tags) for available revisions and the [image revision policy](https://github.com/wodby/images#image-revisions) for upgrade guidance.
Existing SemVer image tags remain available.

Overview:

- All images based on Alpine Linux
- Base image: [_/memcached](https://hub.docker.com/_/memcached)
- [GitHub actions builds](https://github.com/wodby/memcached/actions) 
- [Docker Hub](https://hub.docker.com/r/wodby/memcached)

[_(Dockerfile)_]: https://github.com/wodby/memcached/tree/master/Dockerfile

Supported tags and respective `Dockerfile` links:

- `1`, `latest` [_(Dockerfile)_]

All images built for `linux/amd64` and `linux/arm64`

## Environment Variables

| Variable | Description | Default | Memcached option |
| --- | --- | --- | --- |
| `MEMCACHED_MEMORY` | Memory limit in megabytes | `64` | `-m` |
| `MEMCACHED_THREADS` | Number of threads | `4` | `-t` |
| `MEMCACHED_MAX_CONNECTIONS` | Maximum simultaneous connections | `1024` | `-c` |

## Orchestration Actions

Usage:
```
make COMMAND [params ...]
 
commands:
    check-ready host max_try wait_seconds delay_seconds
    check-setting host setting value
    flushall host
    
default params values:
    host localhost
    max_try 1
    wait_seconds 1
    delay_seconds 0
```
