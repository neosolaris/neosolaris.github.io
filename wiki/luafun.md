---
title: LuaFun - LuaJit Functional
date: 2022-10-12T17:27:21+09:00
lastmod:
tags: ['luafun','luajit','library','functions']
categories: ['programming']
---

## Intro
* LuaFun 정의 - LuaJit Hight Performance Functional Programming Library
* luajit의 내장함수를 확장하여 다양한 프로그래밍을 돕는다.
* 하나씩 공부해서 활용하면 매우 강력한 툴이 될 것이다.

## Usage
* 기본 사용법
```console
$ git clone https://github.com/luafun/luafun.git
$ cd luafun
$ luajit -i 

> -- Functional style
> require "fun" ()
> -- calculate sum(x for x^2 in 1..n)
> n = 100
> print(reduce(operator.add, 0, map(function(x) return x^2 end, range(n))))
328350

> -- Object-oriented style
> local fun = require "fun"
> -- calculate sum(x for x^2 in 1..n)
> print(fun.range(n):map(function(x) return x^2 end):reduce(operator.add, 0))
328350
```

## Using the Library

## Links
* github <https://github.com/luafun/luafun>
* Document <https://luafun.github.io/>
