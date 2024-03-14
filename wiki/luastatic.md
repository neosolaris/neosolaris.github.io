---
title: Luastatic - lua 독립실행 바이너리 컴파일러
date: 2022-08-30T04:57:48+09:00
lastmod: 2022-11-29T16:15:16+09:00
tags: ["lua","luastatic"]
categories: ["programming"]
---

## Intro

* lua 스크립트를 단독 실행 파일로 만들어 주는 프로그램 (gcc로 컴파일)
* 코드를 숨기고 빠른 단독 실행 프로그램으로 바꾸고자 하는 경우에 유용
* 또는 개발시 여러개의 루아파일을 require로 사용할 경우 하나로 합치고자 할 때
* [luarocks](luarocks)로 설치한다. 
* luarocks로 설치된 모듈은 `~/.bashrc`에 `eval "$(luarocks path --bin)"`로 설정했기 때문에 자동으로 포함된다.
* 문제는 같은 리눅스라도 버전간 배포판간에 glibc 호환이 되지 않는다는 점이다.
* 거의 동일한 환경에서만 배포 가능하다고 본다.
* 단, alpine linux의 경우에는 glibc 버전 문제가 없고, 용량도 작다.
* debian 계열 요구사항: build-essential(gcc), lua, luastatic
* alpine Linux 요구사항: build-base, clang, luajit, luastatic

## Install and Howto
 
* Install
```console
$ luarocks install --local luastatic    # install luastatic
$ export PATH=$PATH:$HOME/.luarocks/bin # set PATH for luarocks bin
$ luastatic                             # show version and usage
```

* Compile Single Lua file
```console
$ luastatic myprogram.lua \         
    /usr/lib/x86_64-linux-gnu/liblua5.1.a \
    -I /usr/include/lua5.1
$ ./myprogram
```

* Embed library.lua for require("library")
```console
$ luastatic myprogram.lua \         
    myprogram.lua \
    library.lua \
    /usr/lib/x86_64-linux-gnu/liblua5.1.a \
    -I /usr/include/lua5.1
```

* C library containing luaopen_()
```console
$ luastatic myprogram.lua \         
    library.a \
    /usr/lib/x86_64-linux-gnu/liblua5.1.a \
    -I /usr/include/lua5.1
```

* LuaJit on Ubuntu - 우분투에서 LuaJit 사용
```console
$ sudo apt install luajit               # install luajit - 2.1.0
$ sudo apt install libluajit-5.1-dev    # install libluajit dev - 5.1
$ luastatic myprogram.lua \         
    /usr/lib/x86_64-linux-gnu/libluajit-5.1.a \
    -I /usr/include/luajit-2.1 \
    -no-pie
```
* LuaJit on Alpine - LuaJit, clang with musl lib static compile
```console
# apk add luajit luajit-dev  # install luajit - 2.1.0
# apk add build-base clang make    # install build base and clang
# env CC=clang luastatic myprogram.lua \         
    /usr/lib/x86_64-linux-gnu/libluajit-5.1.a \
    -I /usr/include/luajit-2.1 \
    -no-pie
```

* 좀 더 자세한 내용은 아래 링크를 참조

## Links
<https://github.com/ers35/luastatic>
