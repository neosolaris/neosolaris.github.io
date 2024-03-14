---
title: Neovim 설치 및 설정
date: 2022-09-01T14:57:43+09:00
lastmod: 2023-08-08T15:37:35+09:00
tags: ["nvim","neovim","install"]
categories: ["editor"]
---

* [X] 20-08-08: alpine 설치 추가

## 개요

* https://github.com/neovim/neovim/releases 에서 최신 안정 버전을 다운로드
* 그간 많은 변화가 있었기 때문에 여러 설치 및 에러를 방지하려면 neovim v0.7 이상을 설치한다.
* 아래 내용은 우분투 22.04를 기준으로 한다.
* 우분투 PPA 패키지로 현재 neovim은 v0.7.2이다.

## NVIM의 특징

* [luaJIT](luaJIT)이 기본 내장되어 lua를 설정에서 모듈까지 쉽게 확장 가능.
* terminal 기능이 있어 바로 사용가능하다. `:terminal`
* 커서 스타일, 포커스 이벤트, 괄호에 붙여 넣기 기본 지원
* 자동완성, 맞춤법 검사, 탭, 구문 색상지정, 정규표현식으로 검색 및 바꾸기 등
* Asynchronous Plugin Architecture를 지원, 재컴파일 없이 모듈 장착 가능
* Parallel installation/update of plugins - 병렬식으로 플러그인 설치가 매우 빠름
* Post-update hook - 플러그인 설치 후에 해야 할 일을 지정해 놓으면 알아서 수행
* 플러그인의 버전 관리, 종속성 관리가 편리하다.

## 패키지 설치

1. Ubuntu 설치

* `appimage`를 직접 다운로드해서 설치
```console
$ wget https://github.com/neovim/neovim/releases/download/v0.6.1/nvim.appimage
$ mv nvim.appimage ~/bin/nvim
$ chmod u+x ~/bin/nvim
```

* Ubuntu ppa 최신패키지 설치
```console
$ sudo apt install software-properties-common -y
$ sudo add-apt-repository ppa:neovim-ppa/stable -y
$ sudo apt update
$ sudo apt install neovim -y
$ nvim --version
```

2. Alpine 설치
```console
$ doas apk update
$ doas apk add neovim    # nvim Install
$ apk search nvim-*      # Plugin check
$ apk nvim-lualine nvim-treesitter    # Plugin: lualine install
$ nvim --version

## 소스 빌드 - Debian, Ubuntu

* Requirements
```console
$ sudo apt install build-essencial cmake ninja luarocks5.1
$ sudo luarocks5.1 install lpeg
$ sudo luarocks5.1 install mpack
```

* Build
```console
$ git clone https://github.com/neovim/neovim
$ cd neovim 
$ git checkout stable
$ make CMAKE_BUILD_TYPE=RelWithDebInfo  # or CMAKE_BUILD_TYPE=Release
$ sudo make install
$ strip /usr/local/bin/nvim
$ /usr/local/bin/nvim --version
```

## 소스 빌드 - Alpine

* Requirements
```console
# apk add build-base cmake automake autoconf libtool pkgconf coreutils curl unzip gettext-tiny-dev
```

* Build
```console
# git clone https://github.com/neovim/neovim
# cd neovim 
# git checkout stable
# make CMAKE_BUILD_TYPE=RelWithDebInfo  # or CMAKE_BUILD_TYPE=Release
# sudo make install
# strip /usr/local/bin/nvim
# /usr/local/bin/nvim --version
```

## 소스 빌드 - Raspbian (2023-09-17)
* 라즈베리파이의 neovim 버전이 매우 낮다. 
* 현재로서는 컴파일해서 사용하는 것이 최신버전을 쓰는 제일 좋은 방법으로 보인다.
```
# Install latest CMake https://stackoverflow.com/a/56690743/13411047
sudo apt update
sudo apt install -y libssl-dev
wget -O /tmp/cmake.tar.gz "https://cmake.org/files/v3.19/cmake-3.19.1.tar.gz"
tar -xvzf cmake.tar.gz
rm cmake.tar.gz
cd cmake-3.19.1/
cmake .
make
sudo make install

# Requirements Install
sudo apt-get install git
sudo apt-get install libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

# source download
git clone https://github.com/neovim/neovim.git
cd neovim

# compile & Install
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## 주요 설정파일

* vimscript 설정 기준

```
~/.config/nvim/init.vim
~/.local/share/nvim/site/autoload/plug.vim
```

* lua 설정 기준

```
~/.config/nvim/init.lua
~/.config/nvim/lua/
```

## Links
* neovim home: <https://neovim.io/>
* building noevim: <https://github.com/neovim/neovim/wiki/Building-Neovim>
