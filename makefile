.POSIX:
.SILENT:
.PHONY: \
	all \
	docker-build \
	docker-build-bookworm \
	docker-build-trixe \
	docker-push \
	docker-push-bookworm \
	docker-push-trixie \
	docker-test \
	docker-test-bookworm
	docker-test-trixie \
	test \
	test-bookworm \
	test-trixie

all: test

docker-build: docker-build-bookworm docker-build-trixie

docker-build-bookworm:
	tuggy -t n4jm4/raspberry-pi-os:bookworm --load -- --build-arg DIST=bookworm

docker-build-trixie:
	tuggy -t n4jm4/raspberry-pi-os:trixie --load -- --build-arg DIST=trixie

docker-push: docker-push-bookworm docker-push-trixie

docker-push-bookworm:
	tuggy -t n4jm4/raspberry-pi-os:bookworm --push -- --build-arg DIST=bookworm

docker-push-trixie:
	tuggy -t n4jm4/raspberry-pi-os:trixie -a n4jm4/raspberry-pi-os --push -- --build-arg DIST=trixie

docker-test: docker-test-bookworm docker-test-trixie

docker-test-bookworm:
	tuggy -t n4jm4/raspberry-pi-os:test-bookworm --load -- --build-arg DIST=bookworm
	tuggy -t n4jm4/raspberry-pi-os:test-bookworm --push -- --build-arg DIST=bookworm

docker-test-trixie:
	tuggy -t n4jm4/raspberry-pi-os:test-trixie --load -- --build-arg DIST=trixie
	tuggy -t n4jm4/raspberry-pi-os:test-trixie --push -- --build-arg DIST=trixie

test: test-bookworm test-trixie

test-bookworm: docker-build-bookworm
	docker run --rm n4jm4/raspberry-pi-os:bookworm echo "Hello World"

test-trixie: docker-build-trixie
	docker run --rm n4jm4/raspberry-pi-os:trixie echo "Hello World"
