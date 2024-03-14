---
title: Luarocks - lua 패키지 관리
date: 2022-08-30T05:09:02+09:00
lastmod:
tags: ["luastatic","lua"]
categories: ["programming"]
---

## INTRO

* lua의 확장 패키지를 설치하고 관리하는 프로그램이다.

## INSTALL and SETUP

* Install System-Wide : `/usr/local/`
```console
$ sudo apt install luarocks     # luarocks 설치
$ sudo luarocks install stdlib  # 표준 라이브러리 설치
$ sudo chmod a+r /usr/local/share/lua/5.1/* # 일반사용자 읽기 권한 부여

$ sudo luarocks install package_name # 패키지 설치
```

* Install User Base : `$HOME/.luarocks`
```console
$ sudo apt install luarocks     # luarocks 설치
$ echo 'PATH=$PATH:$HOME/.luarocks/bin' >> ~/.bashrc # add luarock bin path
$ echo 'eval "$(luarocks path --bin)"' >> ~/.bashrc  # add LUA_PATH, LUA_CPATH
$ . ~/.bashrc

$ luarocks install --local package_name   # 패키지 설치 (--local)
```

* Rcoktree Structure: 기본 설치 구조
```
 {base}                (base rocks tree directory)
  ├── bin              (deployment of command line scripts)
  ├── lib
  │    ├── luarocks
  │    │    └── rocks  (contains manifest and sub-dirs with rocks)
  │    │
  │    └── lua
  │         └── 5.1    (deployment of binary modules)
  │
  └── share
       └── lua
            └── 5.1    (deployment of Lua modules)
```

## Usage

```console
$ luarocks                      # show help and usage
$ luarocks list                 # show installed packages
$ luarocks search pack_name     # search packages
$ luarocks install pack_name    # remove installed packages
$ luarocks show pack_name       # show info installed packages
$ luarocks remove pack_name     # remove installed packages
```

## 패키지 설치 및 사용례

* 패키지는 <http://luarocks.org> 참조 - 각 모듈 다운로드 순위도 참고

* 실제 사용례
```console
$ luarocks search  luafilesystem
$ luarocks install --local luafilesystem
$ luarocks list
$ luarocks show luafilesystem
$ vim attrdir.lua

#!/usr/bin/env lua
local lfs = require"lfs"    -- import luafilesystem module

function attrdir (path)
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path..'/'..file
            print ("\t "..f)
            local attr = lfs.attributes (f)
            assert (type(attr) == "table")
            if attr.mode == "directory" then
                attrdir (f)
            else
                for name, value in pairs(attr) do
                    print (name, value)
                end
            end
        end
    end
end

attrdir (".")

$ chmod u+x attrdir.lua
$ ./attrdir.lua
```

## Links
* <https://luarocks.org/>
* <https://github.com/luarocks/luarocks/wiki/Using-LuaRocks>
* <https://leafo.net/guides/customizing-the-luarocks-tree.html>
