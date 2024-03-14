---
title: AstroNvim
date: 2022-09-03T14:51:22+09:00
lastmod:
tags: ["astronvim", "nvim"]
categories: ["editor"]
---

## Intro

* neovim(nvim)에 다양한 설정과 플러그인을 통하여 개발환경 IDE를 구성
* [Lua](lua) 를 기반으로 구성하였기 때문에 빠르고 쾌적하다.
* 자동완성, 파일탐색, 검색기능, snipet등 필요한 거의 모든 것이 기본 제공된다.
* 추가로 사용자 정의를 할 수 있다.

## Install

```console
$ mv ~/.config/nvim ~/.config/nvim.bak  # 기존 nvim 설정을 백업
$ mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak # 기존 플러그인 백업
$ git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim # 복사
$ nvim +PackerSync # 설치
```

## Setup

* Install LSP (Language Server Protocol) - 프로그래밍 언어 지원 설치
    - 나중에 추가 설치시 `Space` + `l` + `I` 맵키 사용
    - `:LspInstall clangd`                  - c, c++
    - `:LspInstall rust-analyzer`           - rust
    - `:LspInstall luau-lsp`                - lua
    - `:LspInstall marksman`                - markdown
    - `:LspInstall jedi-language-server`    - python3

* Install Language Parser
```
:TSInstall python
```

* Manage Plugins - 패키지 관리
    - `:PackerClean`   - 패키지 제거 및 청소
    - `:PackerSync`    - 패키지 청소 및 업데이트
    - `:PackerUpdate`    - 패키지 업데이트

* Astronvim Reload
    - `:AstroReload`  - 다시 올림 (문제가 생길소지, 재실행하는 것이 더 좋음)

## Features

* `neo-tree.nvim` - 파일 탐색기
* `nvim-cmp` - 자동 완성
* `gitsigns.nvim` - Git integration
* `feline.nvim` - 상태라인
* `toggleterm`  - 터미널
* `telescope.nvim` - Fuzzy 검색
* `nvim-treesitter` - Syntax highlighting 
* `null-ls.nvim` - Formatting and linting
* `nvim-lsconfig` - Language Server Protocol 

## 사용자 설정

* 추가 설정이나 사용자 설정을 하려면 다음과 같다. 처음이라면 우선 사용해 보고 나중에 설정하는 것이 좋겠다.
```console
$ cp -r ~/.config/nvim/lua/user_example/ ~/.config/nvim/lua/user/ # copy exmaple
$ nvim ~/.config/nvim/lua/user/init.lua     # 설정하기
```

## 사용방법

* 아래 `Space`는 스페이스 키이고, `+`는 조합하라는 뜻, 대소문자 구분.
* 명령모드에서 `Space`만 누르면 주메뉴가 보인다.

    * `Space` + `lS` - Opening LSP symbols: LSP 심볼창 열기
    * `Space` + `c` - Close buffer: 현재 버퍼창 닫기
    * `Space` + `/` - Commenting: 한줄(커서위치후) 또는 여러줄(v로 영역선택후) 주석달기
    * `Space` + `lr` - Open rename prompt
    * `Space` + `la` - Code actions 
    * `Space` + `ff` - Telescope search: 퍼지 파일검색
    * `Space` + `fw` - Telescope grep: 퍼지 파일내용검색
    * `Space` + `gt` - Telescope git status
    * `Space` + `fo` - Telescope old files

* 문서 내 이동
    * `Shift` + `k` - Hover document: 도움말이나 문서창 내에서 이동
    * `g` + `l` - Show line diagnostics 
    * `g` + `d` - Go to definition: 함수나 변수 정의 위치로 가기

* 탭과 창간의 이동
    * `Shift` + `h` - 왼쪽 버퍼창으로 이동
    * `Shift` + `l` - 오른쪽 버퍼창으로 이동
    * `Ctrl` + `h` - 왼쪽 창으로 이동
    * `Ctrl` + `l` - 오른쪽 창으로 이동
    * `Ctrl` + `k` - 위쪽 창으로 이동
    * `Ctrl` + `j` - 아래쪽 창으로 이동

* 버퍼창 크기조절 
    * `Ctrl` + `left key` - 왼쪽으로 사이즈 변경
    * `Ctrl` + `right key` - 오른쪽으로 사이즈 변경
    * `Ctrl` + `up key` - 위쪽으로 사이즈 변경
    * `Ctrl` + `down key` - 아래쪽으로 사이즈 변경

## Links

< https://astronvim.github.io/>
