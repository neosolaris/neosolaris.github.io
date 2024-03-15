---
title: Lua Install
date: 2022-08-30T04:54:41+09:00
lastmod: 2022-09-17T15:44:19+09:00
tags: ["lua","install"]
categories: ["programming"]
---

## Install

* 설치 - luaJit과의 호환을 위해 5.1로 설치.
```console
sudo apt install lua5.1
```

* `lua -v` - version
* `lua -h` - help
* `lua -i` - interactive mode

## Hello World

* hello-world.lua
```lua
#!/usr/bin/env lua
print("Hello World!")
```
* 실행
```console
chmod u+x hello-world.lua
./hello-world.lua
```

## Lua - Cli 인터프리터
```console
$ lua
Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
> print('Hello World!')
Hello World!
> os.exit()  -- 또는 Control + d (리눅스)
```
