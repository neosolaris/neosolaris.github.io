---
title: Alpine Linux
date: 2023-08-08T15:58:42+09:00
tags: ['linux','alpine']
categories: ['linux']
---

last updated: {{ "1718885075" | date: "%Y-%m-%d %H:%M" }}

## Intro
* Docker에서 많이 사용되어 유명해졌다.
* 다음은 알파인 리눅스의 세가지 특징이자 철학이다.
    - Small: musl libc + busybox (container: 8MB, Minimal Disk Install: 130MB)
    - Simple: package manager `apk`, Init System `OpenRC` and Fast
    - Secure: Position Independent Executables(PIE)

## INSTALL
* [alpine_install](alpine_install) - 설치
* [alpine_upgrade](alpine_upgrade) - 업그레이드
* [alpine_devel](alpine_devel) - 개발환경
* [alpine_wsl2](alpine_wsl2) - 윈도우즈 WSL2에서 alpine 설치

## REFERENCE
* [docker-busybox](docker-busybox)
* Alpine FAQ: https://wiki.alpinelinux.org/wiki/Alpine_Linux:FAQ
* Alpine Tutorial and Howtos: https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos
