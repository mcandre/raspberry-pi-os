# raspberry-pi-os: Docker base image for Raspberry Pi OS

[![Docker Pulls](https://img.shields.io/docker/pulls/n4jm4/raspberry-pi-os)](https://hub.docker.com/r/n4jm4/raspberry-pi-os)

# SUMMARY

[Raspberry Pi](https://www.raspberrypi.com/) supports embedded development.

[Docker](https://www.docker.com/) supports cloud development.

_¿Por qué no los dos?_

# EXAMPLE

```console
% docker run --rm --platform linux/arm64 n4jm4/raspberry-pi-os raspinfo
No GPIO chips found
```

Docker containers don't normally feature embedded hardware like GPIO pins! But we can still test a lot of functionality, such as ARM compatibility for general applications.

```console
% docker run --rm --platform linux/arm64 -it n4jm4/raspberry-pi-os bash

# apt update
# apt install -y file gcc

# printf "#include <stdio.h>\nint main(){ printf(\"Hello World\\\n\"); return 0; }\n" >hello.c

# cat hello.c
#include <stdio.h>
int main(){ printf("Hello World\n"); return 0; }

# gcc -o hello hello.c

# file hello
hello: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=b4b84ec877bfaea87e511fda2f0dca6f1effd947, for GNU/Linux 3.7.0, not stripped

# ./hello
Hello World
```

# INSTALL

```sh
docker pull n4jm4/raspberry-pi-os
```

For more details on developing Raspberry Pi OS images, see our [development guide](DEVELOPMENT.md).

## Images

Raspberry Pi OS identifies versions by Debian base distribution.

| Distribution | Tags           |
| ------------ | -------------- |
| trixie       | trixie, latest |
| bookworm     | bookworm       |

## Platforms

Here, `linux/arm64` is the premier Docker platform for ARM projects. Though Raspberry Pi OS also supports other architecture as well, for developer convenience.

* `linux/386`
* `linux/amd64`
* `linux/arm64`
* `linux/armv5`
* `linux/armv7`

# RUNTIME REQUIREMENTS

* [Docker](https://www.docker.com/) 28.0.1+

## Recommended

* a UNIX-like environment (e.g. [WSL](https://learn.microsoft.com/en-us/windows/wsl/))

# SEE ALSO

* [Raspberry Pi for Dummies](https://www.amazon.com/dp/1119796822), an approachable book for people who like to tinker
* [raspberrypi-os-docker](https://github.com/dtcooper/raspberrypi-os-docker), an earlier Docker image
* [mcandre/rockhopper](https://github.com/mcandre/rockhopper), a multiplatform package generator
* [mcandre/tuggy](https://github.com/mcandre/tuggy), an automated Docker multiplatform image builder

🍇
