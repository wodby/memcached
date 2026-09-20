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

## Building with pinned base images

Build with the Makefile to use the base image digests in `base-images.mk`. Local
builds and CI resolve the same version and variant to the same multi-platform
image. A version without a pin fails before the build starts.

When adding a supported base version or variant, add its image index digest to
`base-images.mk`. For a custom build, override `BASE_IMAGE` with a complete
`repository:tag@sha256:...` reference.
