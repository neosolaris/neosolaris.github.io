---
title: nvim 기본 제공 기능들
date: 2022-12-17T05:56:20+09:00
lastmod:
tags: ['nvim','features']
categories: ['editor']
---

## Intro
* 이문서는 현재 최신 버전 nvim 0.8.1을 기준으로 한다.
* nvim의 기본 내장 기능으로도 매우 훌륭한 많은 것들이 제공된다.
* 중요한 플러그인과 기능이 내장된 것들도 많다.
* 중복되거나 불필요한 플러그인을 많이 설치하기보다는 기본 제공 기능을 충분히 살펴보고 가볍고 효율적으로 사용하는 것이 좋을 듯.

## Features
* lsp(Language Server Protocol) 내장
* treesitter 내장
* 맨페이지와 터미널에뮬레이터: `:Man`, `:terminal`
* vim과 차이 비교: `:help nvim-from-vim`
* 훌륭한 defaults 기능들(아래 Defaults 섹션 참조)

## Defaults
* help로 확인
```
:help defaults
```
* command-line highlighting
* commands:
```
:checkhealth   nvim의 상태 검사
:dr[op] {file} Edit the first {file} in a window 
:Man {name}    manpage view
:match         can be invoked before highlight group is defined
:source        reset config works with lua
:write         with ++p flag creates parent directories
:terminal      terminal support
```
* 맨페이지 보기 - `man.lua`로 동작한다.
```
:Man printf           printf() 함수 맨페이지 보기(수평)
:vertical Man printf  창 수직분할 보기
:Man {sect} {name}    섹션 지정 맨페이지
:help Man             관련 도움말 보기
```

## Links
* neovim.io <https://neovim.io/>
