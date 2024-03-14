---
title: Zig
date: 2024-03-12T03:21:08+09:00
lastmod:
tags: ['zig','programming','language']
categories: ['language']
---

## Intro
* a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software.

## Install

* Debian/Ubuntu
```console
$ sudo apt install zig
```

* Alpine
```console
$ doas apk add zig
```

* 최신 리눅스 버전 설치
- <https://ziglang.org/download/>
- os와 아키텍쳐에 맞는 파일을 다운로드한다.
- 압축을 푼 후 `PATH`를 설정해주면 바로 사용 가능하다.

```console
$ tar xJf zig-linux-x86_64-0.12.0-dev.3212+40e64245f.tar.xz
$ ln -s zig-linux-x86_64-0.12.0-dev.3212+40e64245f/ zig
$ cd zig; ls 
$ ./zig help
```

## Links
* home - <https://ziglang.org/>
* reference - <https://ziglang.org/documentation/0.11.0/>
