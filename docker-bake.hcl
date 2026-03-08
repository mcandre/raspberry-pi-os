variable "PLATFORMS" {
    # https://archive.raspberrypi.org/debian/dists/
    # https://github.com/tonistiigi/binfmt
    # https://hub.docker.com/_/debian
    default = [
        "linux/386",
        "linux/amd64",
        "linux/amd64/v2",
        "linux/arm/v7",
        "linux/arm64",
    ]
}

variable "PRODUCTION" {
    default = [
        "bookworm",
        "trixie",
    ]
}

variable "TEST" {
    default = [
        "test-bookworm",
        "test-trixie",
    ]
}

group "production" {
    targets = PRODUCTION
}

group "test" {
    targets = TEST
}

group "all" {
    targets = concat(PRODUCTION, TEST)
}

target "bookworm" {
    platforms = PLATFORMS
    args = { DIST = "bookworm" }
    tags = [
        "n4jm4/raspberry-pi-os:bookworm",
    ]
}

target "test-bookworm" {
    platforms = PLATFORMS
    args = { DIST = "bookworm" }
    tags = [
        "n4jm4/raspberry-pi-os:test-bookworm",
    ]
}

target "trixie" {
    platforms = PLATFORMS
    args = { DIST = "trixie" }
    tags = [
        "n4jm4/raspberry-pi-os:trixie",
        "n4jm4/raspberry-pi-os",
    ]
}

target "test-trixie" {
    platforms = PLATFORMS
    args = { DIST = "trixie" }
    tags = [
        "n4jm4/raspberry-pi-os:test-trixie",
    ]
}
