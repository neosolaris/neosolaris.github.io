---
title: Zig Programming Language
date: 2024-03-12T03:21:08+09:00
tags: ['zig','programming','language']
categories: ['language']
---

last updated: {{ "1710903214" | date: "%Y-%m-%d %H:%M" }}


## Intro
* a general-purpose programming language and toolchain for maintaining robust, optimal and reusable software.

## Install

* Debian/Ubuntu

```console
$ sudo apt install zig
```

* Alpine Linux

```console
$ doas apk add zig
```

* 최신 리눅스 버전 설치
  - <https://ziglang.org/download/>
  - os와 아키텍쳐에 맞는 파일을 다운로드한다.
  - 압축을 푼 후 `PATH`를 설정해주면 바로 사용 가능하다.
  - 현재 사용 버전: 0.12

```console
$ tar xJf zig-linux-x86_64-0.12.0-dev.3212+40e64245f.tar.xz
$ ln -s zig-linux-x86_64-0.12.0-dev.3212+40e64245f/ zig
$ cd zig; ls 
$ ./zig version
$ ./zig help
```
## Hello World

* `hello-world.zig`

```zig
const std = @import("std");

pub fn main() !void {
    std.debug.print("Hello, World!\n", .{});
}
```

* run / test

```console
$ zig run hello-world.zig
$ zig test hello-world.zig
```

*  build (default=debug, small, fast, safe)

```console
$ zig build-exe hello.zig
$ ./hello

$ zig build-exe --name hello-small -O ReleaseSmall hello.zig
$ zig build-exe --name hello-fast -O ReleaseFast hello.zig
$ zig build-exe --name hello-safe -O ReleaseSafe hello.zig
$ zig build-exe --name hello-debug -O Debug hello.zig

$ ls -l 
$ ./hello-small
```

## 관련 문서

* [zig-nvim](zig-nvim.md) - neovim에 zig 개발 환경 설정하기

## Links
* home - <https://ziglang.org/>
* awesome zig - <https://www.trackawesomelist.com/catdevnull/awesome-zig/readme/>

## Study and Docs
* zig-guide - <https://zig.guide/>
* reference - <https://ziglang.org/documentation/0.11.0/>
* zig-by-example - <https://zig-by-example.com/>
* zig std - <https://ziglang.org/documentation/master/std/>

## Compile and Build
* zig-cc - <https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html>
* Zig Build System Internals - <https://mitchellh.com/zig/build-internals>
