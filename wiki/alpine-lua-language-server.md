---
title: Alpine - Lua Language Server Install
date: 2022-11-21T01:09:54+09:00
lastmod: 2023-08-08T16:17:56+09:00
tags: ['alpine','linux','lua','lsp','language-server']
categories: ['linux']
---

- [X] 23-08-08: 버전이 3.18대로 올라오고, Community Repository를 추가하면 패키지로 간단히
  설치할 수가 있다. 최적화나 컴파일 자체에 의미를 두지 않는다면 패키지로 설치하자.

## PREINSTALL

* clang 및 luajit 및 개발 툴 설치
* 필수: build-base, clang, clang-extra-tools(clangd), cmake, luajit, luajit-dev
```console
# apk add --no-cache build-base clang clang-extra-tools lld compiler-rt compiler-rt-static cmake git luajit luajit-dev bash bash-completion grep rlwrap bat fd curl wget rsync sqlite jq tree
```

* ninja 설치 - alpine 3.16.3 현재 기본 패키지 없음
```console
# git clone https://github.com/ninja-build/ninja && cd ninja
# cmake -Bbuild-cmake
# cmake --build build-cmake
# ./build-cmake/ninja_test
# cp ./build-cmake/ninja /usr/local/bin/
# which ninja   # PATH 확인
```

## lua-language-server 설치
```console
# cd /usr/local/
# git clone  --depth=1 https://github.com/sumneko/lua-language-server
# cd lua-language-server
# git submodule update --depth 1 --init --recursive

# cd 3rd/luamake
# ./compile/install.sh
# cd ../..
# ./3rd/luamake/luamake rebuild

# ./bin/lua-language-server --version

# cat<<EOF > /usr/local/bin/lua-language-server
#!/usr/bin/env bash
exec "/usr/local/lua-language-server/bin/lua-language-server" "$@"
EOF

# chmod 755 /usr/local/bin/lua-language-server
# which lua-language-server  # PATH 확인
```

## clangd 설치
* clangd는 `c`,`c++`을 지원한다.
* clangd는 clang-extra-tools 패키지에 포함되어 있다.

## Links
* ninja build howto 
  - <https://github.com/ninja-build/ninja>
* lua-language-server - Getting Started
  - <https://github.com/sumneko/lua-language-server/wiki/Getting-Started#command-line>
