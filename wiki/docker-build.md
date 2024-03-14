---
title: docker-build 도커이미지 빌드
date: 2022-11-09T23:06:21+09:00
lastmod:
tags: ['docker','build']
categories: ['tools']
---

## Intro
* 프로젝트폴더를 만들고 개발
* Dockerfile을 해당 프로젝트에 작성한다.
* 한라인씩 확인하며 이미지를 빌드한다.
* 빌드한 이미지를 컨테이너를 실행해서 확인한다.

## Example Lemo Apps for Luajit
* 프로젝트 폴더를 만들고 Dockerfile을 생성한다.
```console
$ mkdir myproject && cd myproject
$ vim Dockerfile
```

* 생성된 Dockerfile
```
FROM nickblah/luajit:2.1.0-beta3-buster

## Default root Env Setup First
WORKDIR /root
RUN \
  echo 'set -o vi' >> .bashrc

## LEMO Program Set
WORKDIR /usr/local
COPY lemo ./lemo
RUN \
  echo 'exec "/usr/local/lemo/lib/main.lua" "$@"' > ./bin/lemo &&\
  chmod 755 ./bin/lemo
```

# Image Build
```console
$ docker build -t buster:lemo .  # 빌드
$ docker images  # 빌드한 이미지 확인
$ docker run --rm -it buster:lemo bash  # 이미지를 컨테이너 실행 및 테스트
```

## Links
* <https://docs.docker.com/engine/reference/builder>
* <https://www.44bits.io/ko/post/easy-deploy-with-docker>
