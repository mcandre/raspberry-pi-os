# DEVELOPMENT GUIDE

raspberry-pi-os follows standard, Docker based operations for building and testing images.

For advanced operations, such as linting, we further supplement with some software industry tools.

# BUILDTIME REQUIREMENTS

* [Docker](https://www.docker.com/) 28.0.1+
* POSIX compliant [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))
* Apple Silicon macOS users may want to apply `DOCKER_DEFAULT_PLATFORM=linux/amd64`, in order to account for images commonly lacking `linux/arm64` buildx platforms
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
