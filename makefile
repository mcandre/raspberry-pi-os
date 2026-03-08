.POSIX:
.SILENT:
.PHONY: \
	all \
	docker-build \
	docker-push \
	docker-test \
	test \
	test-bookworm \
	test-trixie

all: test

docker-build:
	docker buildx bake all

docker-push:
	docker buildx bake production --push

docker-test:
	docker buildx bake test --push

test: test-bookworm test-trixie

test-bookworm:
	docker run --rm n4jm4/raspberry-pi-os:bookworm cat /etc/apt/sources.list.d/raspi.list

test-trixie:
	docker run --rm n4jm4/raspberry-pi-os:trixie cat /etc/apt/sources.list.d/raspi.list
