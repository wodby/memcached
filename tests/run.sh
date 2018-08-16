#!/bin/bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

cid="$(docker run -d --name "${NAME}" "${IMAGE}")"
trap "docker rm -vf $cid > /dev/null" EXIT

memcached() {
	docker run --rm -i --link "${NAME}" "${IMAGE}" "${@}"
}

memcached make check-ready host="${NAME}"
memcached make flushall host="${NAME}"