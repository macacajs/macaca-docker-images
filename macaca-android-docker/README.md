# Macaca Android Docker Image

[![build status][travis-image]][travis-url]
[![docker pull][docker-pull-image]][docker-url]
[![docker pull][docker-size-image]][docker-url]
[![docker pull][docker-layers-image]][docker-url]

[travis-image]: https://img.shields.io/travis/macacajs/macaca-android-docker.svg?style=flat-square
[travis-url]: https://travis-ci.org/macacajs/macaca-android-docker
[docker-pull-image]: https://img.shields.io/docker/pulls/macacajs/macaca-android-docker.svg?style=flat-square&logo=dockbit
[docker-size-image]: https://img.shields.io/microbadger/image-size/macacajs/macaca-android-docker.svg?style=flat-square&logo=dockbit
[docker-layers-image]: https://img.shields.io/microbadger/layers/macacajs/macaca-android-docker.svg?style=flat-square&logo=dockbit
[docker-url]: https://hub.docker.com/r/macacajs/macaca-android-docker/

## Macaca Tools Image

```bash
$ docker build . -t="macacajs/macaca-android-docker"
```

## Only For Build

```bash
$ docker build ./build -t="macacajs/macaca-android-build-docker"
```

## Usage

```bash
$ docker run -it --entrypoint="/bin/bash" macacajs/macaca-android-docker
```

```bash
$ android update sdk --proxy-host mirrors.neusoft.edu.cn --proxy-port 80 -s
```
