# DEVELOPMENT

We follow standard, `docker` based operations for building and testing images.

For advanced operations, such as linting, we further supplement with some software industry tools.

# PREREQUISITES

* [Docker](https://www.docker.com/)
* [make](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/make.html)

# TASKS

We automate engineering tasks.

## Build

```sh
make
```

## Test

```sh
make test
```

## Test Push Images

```sh
make docker-test
```

## Push Images

```sh
make docker-push
```
