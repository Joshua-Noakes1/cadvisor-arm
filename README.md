# cAdvisor ARM and PC build

cAdvisor docker image build for ARM and PC devices (AMD64 64BIT PCs, i386 32BIT PCs, ARMv7 Raspberry PI, ARM64 64Bit ARM Devices).

This package is based on official [google/cadvisor](https://github.com/google/cadvisor)

## Content

- [How it works](#how-it-works)
- [How to use](#how-to-use)
  - [Docker](#docker)
  - [Custom build](#custom-build)

## How it works

This package compile official [google/cadvisor](https://github.com/google/cadvisor) package on AMD64, i386, linux/arm64, linux/arm/v7 with `golang` docker image.

## How to use

### With Docker

#### Supported tags and respective `Dockerfile` links

The best (and recommended) way how to use this package is as [Docker image](https://hub.docker.com/r/budry/cadvisor-arm/).

```shell
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  ghcr.io/joshua-noakes1/cadvisor-arm
```

I trying update build of this package as soon as possible for each [google/cadvisor](https://github.com/google/cadvisor) update, but when you need more actual version I recommend you use custom build.

### Docker Compose Example

```yml
version: "3"

services:
  cadvisor:
    image: ghcr.io/joshua-noakes1/cadvisor-arm
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:rw
      - /sys:/sys
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
    ports:
      - 8080:8080
```

## Custom build

Or you can use custom build on your ARM (Raspberry PI) device.

```shell
git clone git@github.com:Joshua-Noakes1/cadvisor-arm.git
cd cadvisor-arm
docker build -t <image name> .
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/dev/disk/:/dev/disk:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor \
  <image name>:<image tag>
```
