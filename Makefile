-include env_make

MEMCACHED_VER ?= 1.6.37

MEMCACHED_VER_MINOR ?= $(shell echo "${MEMCACHED_VER}" | grep -oE '^[0-9]+\.[0-9]+')

TAG ?= $(MEMCACHED_VER_MINOR)

REPO = wodby/memcached
NAME = memcached-$(MEMCACHED_VER)

PLATFORM ?= linux/arm64

ifneq ($(ARCH),)
	override TAG := $(TAG)-$(ARCH)
endif

.PHONY: build buildx-build buildx-imagetools-create buildx-push test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		--build-arg MEMCACHED_VER=$(MEMCACHED_VER) \
		./

buildx-build:
	docker buildx build --platform $(PLATFORM) -t $(REPO):$(TAG) \
		--build-arg MEMCACHED_VER=$(MEMCACHED_VER) \
		--load \
		./

buildx-push:
	docker buildx build --platform $(PLATFORM) --push -t $(REPO):$(TAG) \
		--build-arg MEMCACHED_VER=$(MEMCACHED_VER) \
		./

buildx-imagetools-create:
	docker buildx imagetools create -t $(REPO):$(TAG) \
				$(REPO):$(MEMCACHED_VER_MINOR)-amd64 \
				$(REPO):$(MEMCACHED_VER_MINOR)-arm64
.PHONY: buildx-imagetools-create

test:
	cd ./tests && IMAGE=$(REPO):$(TAG) NAME=$(NAME) ./run.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) -e DEBUG=1 $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
