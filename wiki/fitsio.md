---
title: fitsio - FITS IO C Library
date: 2022-10-11T17:06:15+09:00
lastmod:
tags: ['fits','fitsio','clib','astro']
categories: ['graphic','astronomy']
---

## Intro
* fits를 편집하기 위한 C 라이브러리 모음
* python, ruby, perl, lua 등의 wrapper가 다양하게 존재한다.

## Lua-ffi-bindings: fitsio.lua
* 깃허브: <https://github.com/thenumbernine/lua-ffi-bindings>
* 요구사항: Luajit, fitsio library
* 사용법: 아래 quick start quide 참고
```console
$ sudo apt install libfitsio-dev
$ git clone https://github.com/thenumbernine/lua-ffi-bindings.git
$ cd lua-ffi-bindings
```
* 그런데 너무 오래된 소스이다. 2009
* 거기다 ffi-binding해서 사용하는 예제도 없다.
* pfits는 역시 오래 되었고, pyfits도 astropy로 통합되었다.
* 이런 것이 있었다 하고 넘어가자.
* 파이썬 사용자라면 astropy를 사용하는 것이 좋겠다.
* 아 루아로는 갈길이 멀다.
* 하지만 현재 [astropy](astropy)나 [fits liberator](fits-liberator)도 내부에는 이 라이브러리를 쓴다.

## Links
* Home: <https://heasarc.gsfc.nasa.gov/fitsio/>
* quick start guide <https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/quick.html>
