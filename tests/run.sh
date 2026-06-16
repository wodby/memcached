#!/bin/bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

env=()

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

if [[ -n "${MEMCACHED_MEMORY}" ]]; then
	memcached make check-setting host="${NAME}" setting=maxbytes value="$((MEMCACHED_MEMORY * 1024 * 1024))"
fi

if [[ -n "${MEMCACHED_THREADS}" ]]; then
	memcached make check-setting host="${NAME}" setting=num_threads value="${MEMCACHED_THREADS}"
fi

if [[ -n "${MEMCACHED_MAX_CONNECTIONS}" ]]; then
	memcached make check-setting host="${NAME}" setting=maxconns value="${MEMCACHED_MAX_CONNECTIONS}"
fi
