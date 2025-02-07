---
title: LuaJit - Lua Just in Time Compiler
date: 2022-08-30T14:51:27+09:00
lastmod: 
tags: ["lua","lugjit"]
categories: ["programming"]
---

last updated: {{ "1736305941" | date: "%Y-%m-%d %H:%M" }}

## Intro

* 함수들이 처음 실행 될 때 필요에 의해 컴파일된다.
* 이것은 어플리케이션이 빠르게 시작되는 것과 불필요한 작업을 발생시키지 않는 것을 보장해 준다.
* LuaJit은 neovim에 기본 탑재되어 있다.
* python, ruby 등의 Jit보다 우수한 성능을 보여준다.
* LuaJit의 FFI(Foreign Function Interface)는 Low-Level C언어 함수들을 별다른 작업 없이 직접적으로 사용할 수 있다.
* 네이티브에 견줄만큼 속도가 빠르고, 메모리 사용량이 매우 적다. 
* nginx에 LuaJIT을 포함시켜서 커스터마이징을 한 OpenResty 웹 서버도 있다.

* lua vs luaJIT
```
* PUC Lua (the "normal interpreter") is more stable, i.e. bugs are more frequently found in LuaJIT.
* PUC Lua is smaller, i.e. it takes less memory.
* PUC Lua is much easier to understand if you want to customize it.
* PUC Lua has been ported to way more platforms and is easier to port.
* Like @lhf said, LuaJIT does not support all of Lua 5.2 features yet.
```

## Install
```console
$ sudo apt update
$ sudo apt install luajit
$ luajit -h
```

## Usage

* 기본 사용법
```console
usage: luajit [options]... [script [args]...].
Available options are:
  -e chunk  Execute string 'chunk'.
  -l name   Require library 'name'.
  -b ...    Save or list bytecode.
  -j cmd    Perform LuaJIT control command.
  -O[opt]   Control LuaJIT optimizations.
  -i        Enter interactive mode after executing 'script'.
  -v        Show version information.
  -E        Ignore environment variables.
  --        Stop handling options.
  -         Execute stdin and stop handling options.
```

* 바이트코드 컴파일
	-  `-b` 옵션은 컴파일 바이너리 코드를 생성한다.
	- lua에서는 소스를 먼저 바이트코드로 만들어 최적화한 후 인터프리터에서 처리한다.
	- 소스코드가 용량이 큰 경우 바이트코드로 미리 컴파일해 두면 훨씬 빨라진다.
	-  `./luajit: unknown luaJIT command or jit.* modules not installed` 에러가
  발생하는 경우는 $LUA_PATH 설정이 잘못되어 있는 경우이므로 `unset LUA_PATH`해주거나
  $LUA_PATH에 luajit의 올바른 모듈경로를 추가해 준다.

```console
$ luajit -b test.lua test.luac                # Save bytecode to test.out
$ luajit -bg test.lua test.luac               # Keep debug info
$ luajit -be "print('hello world')" test.luac # Save cmdline script

$ luajit -bl test.lua                         # List to stdout
$ luajit -bl test.lua test.txt                # List to test.txt
$ luajit -ble "print('hello world')"          # List cmdline script

$ luajit -b test.lua test.obj                 # Generate object file
$ # Link test.obj with your application and load it with require("test")
```
	- 모듈의 경우에도 적용이 가능한데, 다음 두 가지 방법이 있다.
	
```console
$ luajit -b mymodule.lua mymodule.luac
$ luajit
luajit> mymodule = assert(loadfile("module.luac"))()

$ luajit -b /path/to/mymodule.lua ./mymodule.lua
$ luajit
luajit> mymodule = require'mymodule'
```

## FFI(Foreign Function Interface) 

* LuaJIT는 C 함수를 손쉽게 가져와 사용할 수 있다.
* 아래 `ffi`모듈이 luajit의 내장된 기본 모듈이다. 

```console
$ cat<<EOF > test-ffi.lua
local ffi = require("ffi")
ffi.cdef[[int printf(const char *fmt, ...);]]
ffi.C.printf("Hello %s!\n", "wiki")
EOF

$ luajit test-ffi.lua
Hello wiki!
```
* FFI Tutorial - <https://luajit.org/ext_ffi_tutorial.html>
* lua-ffi-bindings - <https://github.com/thenumbernine/lua-ffi-bindings>

## Link
* Lua Jit Introduction - 한글번역
	* <https://m.blog.naver.com/milennium9/20120034562>
* Usage - 사용법
	* <https://luajit.org/running.html>
* LuaJIT Wiki 문서 - 공부의 시작
	* <http://wiki.luajit.org/Home>
