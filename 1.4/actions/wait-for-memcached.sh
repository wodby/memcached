#!/usr/bin/env bash

set -e

if [[ ! -z "${DEBUG}" ]]; then
  set -x
fi

started=0
host=$1
max_try=$2
wait_seconds=$3

for i in $(seq 1 "${max_try}"); do
    if echo "version" | nc "${host}" 11211 | grep 'VERSION 1.4.*' &> /dev/null; then
        started=1
        break
    fi
    echo 'Memcached is starting...'
    sleep "${wait_seconds}"
done

if [[ "${started}" -eq '0' ]]; then
    echo >&2 'Error. Memcached is unreachable.'
    exit 1
fi

echo 'Memcached has started!'