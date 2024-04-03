---
title: Zig로 gcc/clang 컴파일러 대체하기
date: 2024-04-03T09:07:32+09:00
tags: ['zig','cc','compile']
categories: ['programming','zig']
---

last updated: {{ "1712181399" | date: "%Y-%m-%d %H:%M" }}

## Intro

* zig로 c 소스를 컴파일할 수 있다.
* zig의 장점은 여러 플랫폼과 아키텍처용 컴파일이 가능하다는 것이다.
* static, dynamic 모두 가능하다.
* Linux, iOS, Windows 등 여러 OS 환경 지원.
* x86, , x86-64, aarch64 등 아키텍처 지원

## Local Compile

* dynamic: Alpine Linux (x86_64)

```
$ zig cc -o hello_dynamic hello.c
$ file hello_dynamic
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib/ld-musl-x86_64.so.1, with debug_info, not stripped
$ ./hello
Hello World!
```

* static: Alpine Linux (x86_64)

```
$ zig cc -o hello hello.c -target x86_64-linux-musl
$ file hello
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked,
with debug_info, not stripped
$ ./hello
Hello World!
```

## Cross Compile

* For windows

```
$ zig cc -o hello.exe hello.c -target x86_64-windows-gnu
$ file ./hello.exe
hello: PE32+ executable (console) x86-64, for MS Windows, 7 sections
...
Windows c:> .\hello.exe
Hello World!
```

* For Linux Gnu

```
$ zig cc -o hello.exe hello.c -target x86_64-linux-gnu
$ file ./hello.exe
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.0.0, with debug_info,
not stripped
...
gnu-linux$ ./hello
Hello World!
```

* For Linux Static with musl

```
$ zig cc -o hello.exe hello.c -target x86_64-linux-gnu
$ file ./hello.exe
./hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked,
with debug_info, not stripped
...
any-linux$ ./hello
Hello World!
```

## Makefile or Build.sh

* 해당 파일에서 gcc, clang 부분을 `zig cc`로 수정한다.
* `make` 또는 `./Build.sh` 실행

## Links

* `zig cc`: a Powerful Drop-In Replacement for GCC/Clang
	- <https://andrewkelley.me/post/zig-cc-powerful-drop-in-replacement-gcc-clang.html>
