#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

if [[ "${1#-}" != "${1}" ]]; then
    set -- memcached "${@}"
fi

if [[ "${1}" == "memcached" ]]; then
    command="${1}"
    shift

    MEMCACHED_MEMORY="${MEMCACHED_MEMORY:-64}"
    MEMCACHED_THREADS="${MEMCACHED_THREADS:-4}"
    MEMCACHED_MAX_CONNECTIONS="${MEMCACHED_MAX_CONNECTIONS:-1024}"

    set -- "${command}" "${@}"

    set -- "${command}" -c "${MEMCACHED_MAX_CONNECTIONS}" "${@:2}"

    set -- "${command}" -t "${MEMCACHED_THREADS}" "${@:2}"

    set -- "${command}" -m "${MEMCACHED_MEMORY}" "${@:2}"
fi

if [[ $1 == "make" ]]; then
    exec /usr/local/bin/docker-entrypoint.sh "${@}" -f /usr/local/bin/actions.mk
else
    exec /usr/local/bin/docker-entrypoint.sh "${@}"
fi
