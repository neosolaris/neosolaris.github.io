---
title: Zig로 gcc/clang 컴파일러 대체하기
date: 2024-04-03T09:07:32+09:00
tags: ['zig','cc','compile']
categories: ['programming','zig']
---

last updated: {{ "1712680347" | date: "%Y-%m-%d %H:%M" }}

## Intro

* zig로 c 소스를 컴파일할 수 있다.
* zig의 장점은 여러 플랫폼과 아키텍처용 컴파일이 가능하다는 것이다.
* static, dynamic 모두 가능하다.
* Linux, iOS, Windows 등 여러 OS 환경 지원.
* x86, , x86-64, aarch64 등 아키텍처 지원

## Target List

* 다음 방법으로 원하는 플랫폼, 아키텍쳐를 먼저 찾는다.

```console
$ zig targets
$ zig targets | grep x86
$ zig targets | grep x86-64
$ zig targets | grep aarch64
$ zig targets | grep linux
$ zig targets | grep windows
$ zig targets | grep macos
```
- x86, x86_64 - intel 계열
- aarch64 - arm 계열 (raspberrypi)
- linux - Linux
- windows - Ms Windows
- macos - Mac OS

## Local Compile

* dynamic: Alpine Linux (x86_64)

```console
$ zig cc -o hello_dynamic hello.c
$ file hello_dynamic
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib/ld-musl-x86_64.so.1, with debug_info, not stripped
$ ./hello
Hello World!
```

* static: Alpine Linux (x86_64)

```console
$ zig cc -o hello hello.c -target x86_64-linux-musl
$ file hello
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked,
with debug_info, not stripped
$ ./hello
Hello World!
```

## Cross Compile

* For windows

```console
$ zig cc -o hello.exe hello.c -target x86_64-windows-gnu
$ file ./hello.exe
hello: PE32+ executable (console) x86-64, for MS Windows, 7 sections

Windows c:> .\hello.exe
Hello World!
```

* For Linux dynamic with Gnu Libs

```console
$ zig cc -o hello hello.c -target x86_64-linux-gnu
$ file ./hello.exe
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.0.0, with debug_info,
not stripped

gnu-linux$ ./hello
Hello World!
```

* For Linux Static with musl

```console
$ zig cc -o hello.exe hello.c -target x86_64-linux-gnu
$ file ./hello.exe
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked,
with debug_info, not stripped

any-linux$ ./hello
Hello World!
```

## Makefile or Build.sh

* 해당 파일에서 gcc, clang 부분을 `zig cc`로 수정한다.
* `make` 또는 `./Build.sh` 실행

## Links

* `zig cc`: a Powerful Drop-In Replacement for GCC/Clang
	- <https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html>
