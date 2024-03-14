---
title: Alpine Linux Install
date: 2023-12-30T05:57:18+09:00
lastmod:
tags: ['alpine','install']
categories: ['os']
---

## Intro
* 설치에는 크게 일반적인 설치 방법과 Windows WSL에 올리는 방법이 있다.

### 일반 설치

* ISO 이미지를 부팅용 USB로 작성
* usb 부팅 및 설치
* 패키지 설치 및 설정

### 윈도우즈 설치 ( WSL2 + Alpine )

* 윈도우즈 10, 11 기반, WSL2 설치 또는 업그레이드: `c:> wsl --update`
* Alpine-Wsl 설치 (Microsoft Store)
* 설치 후 실행 아이콘 실행
* 자세한 내용은 다음 문서 참조: [docker windows](docker-windows)

## Upgrade

* 최신 버전으로 업그레이드 하는 방법을 정리한다.
* alpine-wsl에서는 업그레이드가 되지만 버전정보는 그대로이다.
* 아래 `setup-apkrepos` 명령은 vi가 기본 편집기로 사용된다.

```console
$ cat /etc/alpine-release
$ doas apk -U upgrade
$ doas setup-apkrepos
https://dl-cdn.alpinelinux.org/alpine/v3.18/main/
https://dl-cdn.alpinelinux.org/alpine/v3.18/community/
https://dl-cdn.alpinelinux.org/alpine/edge/testing/

$ sudo apk update
$ sudo apk upgrade --available
$ sync
$ reboot
...

$ cat /etcalpine-release
$ uname -r
```


## 관련 문서
* lua-language-server 설치: [alpine lua language server](alpine-lua-language-server)
  설치

## REFERENCE
* Alpine Install: <https://wiki.alpinelinux.org/wiki/Installation>
* Alpine Tutorial and Howtos: <https://wiki.alpinelinux.org/wiki/Tutorials_and_Howtos>
