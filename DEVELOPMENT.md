# DEVELOPMENT GUIDE

raspberry-pi-os follows standard, Docker based operations for building and testing images.

For advanced operations, such as linting and generating install media artifacts, we further supplement with some software industry tools.

# BUILDTIME REQUIREMENTS

* [Docker](https://www.docker.com/) 28.0.1+
* POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)
* [Rust](https://www.rust-lang.org/en-US/)
* Provision additional dev tools with `make -f install.mk`

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* a host capable of running musl/Linux containers (e.g. a GNU/Linux, musl/Linux, macOS, or Windows host)
* [Docker First Aid Kit](https://github.com/mcandre/docker-first-aid-kit)
* [ASDF](https://asdf-vm.com/) 0.18 (run `asdf reshim` after provisioning)

# BUILD DOCKER IMAGES

```sh
make docker-build
```

# TEST

```sh
make [test]
```

# TEST DOCKER PUSH

```sh
make docker-test
```

# DOCKER PUSH

```sh
make docker-push
```
