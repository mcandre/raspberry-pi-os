ARG DIST='trixie'
ARG BASE=library/debian:$DIST
FROM $BASE
ARG DIST
ENV DIST=$DIST

# Pending https://forums.raspberrypi.com/viewtopic.php?t=395895
RUN mkdir -p /etc/crypto-policies/back-ends && \
    cat /usr/share/apt/default-sequoia.config | \
        sed 's/sha1.second_preimage_resistance = 2026-02-01/sha1.second_preimage_resistance = 2036-02-01/' \
        >/etc/crypto-policies/back-ends/apt-sequoia.config

RUN apt update && \
    apt install --no-install-recommends -y \
        ca-certificates \
        curl \
        gpg && \
    curl -L https://archive.raspberrypi.org/debian/raspberrypi.gpg.key | \
        gpg --dearmor -o /etc/apt/trusted.gpg.d/raspberrypi.gpg && \
    apt remove --autoremove --purge -y \
        ca-certificates \
        curl && \
    echo "deb http://archive.raspberrypi.org/debian/ $DIST main" \
        >/etc/apt/sources.list.d/raspi.list && \
    apt update && \
    apt upgrade -y && \
    apt install --no-install-recommends -y \
        libdtovl0 \
        raspi-utils && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
