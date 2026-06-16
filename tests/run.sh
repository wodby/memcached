#!/bin/bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

env=()

memcached_memory="${MEMCACHED_MEMORY:-64}"
memcached_threads="${MEMCACHED_THREADS:-4}"
memcached_max_connections="${MEMCACHED_MAX_CONNECTIONS:-1024}"

if [[ -n "${MEMCACHED_MEMORY}" ]]; then
	env+=(-e "MEMCACHED_MEMORY=${MEMCACHED_MEMORY}")
fi

if [[ -n "${MEMCACHED_THREADS}" ]]; then
	env+=(-e "MEMCACHED_THREADS=${MEMCACHED_THREADS}")
fi

if [[ -n "${MEMCACHED_MAX_CONNECTIONS}" ]]; then
	env+=(-e "MEMCACHED_MAX_CONNECTIONS=${MEMCACHED_MAX_CONNECTIONS}")
fi

cid="$(docker run -d --name "${NAME}" "${env[@]}" "${IMAGE}")"
trap "docker rm -vf $cid > /dev/null" EXIT

memcached() {
	docker run --rm -i --link "${NAME}" "${IMAGE}" "${@}"
}

memcached make check-ready host="${NAME}"
memcached make flushall host="${NAME}"

memcached make check-setting host="${NAME}" setting=maxbytes value="$((memcached_memory * 1024 * 1024))"
memcached make check-setting host="${NAME}" setting=num_threads value="${memcached_threads}"
memcached make check-setting host="${NAME}" setting=maxconns value="${memcached_max_connections}"
