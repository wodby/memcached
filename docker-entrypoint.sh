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

    set -- "${command}" "${@}"

    if [[ -n "${MEMCACHED_MAX_CONNECTIONS}" ]]; then
        set -- "${command}" -c "${MEMCACHED_MAX_CONNECTIONS}" "${@:2}"
    fi

    if [[ -n "${MEMCACHED_THREADS}" ]]; then
        set -- "${command}" -t "${MEMCACHED_THREADS}" "${@:2}"
    fi

    if [[ -n "${MEMCACHED_MEMORY}" ]]; then
        set -- "${command}" -m "${MEMCACHED_MEMORY}" "${@:2}"
    fi
fi

if [[ $1 == "make" ]]; then
    exec /usr/local/bin/docker-entrypoint.sh "${@}" -f /usr/local/bin/actions.mk
else
    exec /usr/local/bin/docker-entrypoint.sh "${@}"
fi
