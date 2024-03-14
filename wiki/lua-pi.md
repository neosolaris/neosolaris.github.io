---
title: Raspberry-Pi에서 lua 개발 환경 설치
date: 2022-09-13T17:19:34+09:00
lastmod:
tags: ["lua","devel","raspberry-pi","luastatic"]
categories: ["programming"]
---


## Install

* [luarocks](luarocks) 를 이용하지 않고 필요한 모듈만 설치해서 사용하고자 할 때
```console
$ sudo apt update && sudo apt upgrade
$ apt install git build-essensial       #git, gcc, make 환경 필요
$ apt install lua5.1.0 liblua5.1.0      #lua module 컴파일시 liblua 필요
$ git clone https://github.com/lunarmodules/luafilesystem.git #luafilesystem 소스 복사
$ cd luafilesystem
$ make      # gcc, make, liblua5.1.x 필요 조건

$ cp src/lfs.so  your_devel_directory/
$ cd your_devel_directory/
$ vim myprogram.lua
require'lfs'
...
```

## LuaStatic 설치

* 방법1: `luastatic.lua` 자신을 컴파일해서 바이너리로 사용
```console
$ git clone https://github.com/ers35/luastatic.git
$ cd luastatic/
$ uastatic.lua luastatic.lua /usr/lib/arm-linux-gnueabihf/liblua5.1.a -I/usr/include/lua5.1/
$ ./luastatic  # 바이너리 실행 및 버전 확인
```

* 방법2: `luastatic.lua`를 그대로 사용
```console
$ git clone https://github.com/ers35/luastatic.git
$ cd luastatic/
$ ./luastatic.lua  # 스크립트 실행 및 버전 확인
```

## 모듈과 합쳐서 바이너리로 컴파일 하기

* `luastatic.lua` 자신은 의존성이 없으므로 ~/bin 등에 옮긴 후 사용해도 된다. 
* `myprogram.lua`가 같은 폴더에 있는 모듈을 사용한다면 자동으로 포함해서 컴파일된다. 

```console
$ cp luastatic.lua ~/bin
$ luastatic.lua myprogram.lua /usr/lib/arm-linux-gnueabihf/liblua5.1.a -I/usr/include/lua5.1/
```

## 고려 사항

* 위의 예제처럼 컴파일 환경을 만들고 모듈을 만들어 `require`해서 사용.
* 여러 모듈과 `main.lua`가 있을 경우 이를 하나로 합쳐 바이너리로 만든다.
* 또는 파일을 설치하고 실행환경을 만들어 준다. 이에 대해서는 나중에 추가할 예정.
