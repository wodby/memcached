#!/bin/bash

set -e

if [[ ! -z "${DEBUG}" ]]; then
  set -x
fi

IMAGE=$1
NAME=$2

cid="$(docker run -d --name "${NAME}" "${IMAGE}")"
trap "docker rm -vf $cid > /dev/null" EXIT

memcached() {
	docker run --rm -i \
		--link "${NAME}" \
		"${IMAGE}" \
		"${@}"
}

memcached make check-ready host="${NAME}"
memcached make flushall host="${NAME}"