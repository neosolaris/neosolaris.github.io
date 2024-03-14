---
title: Nvim neovim
date: 2022-08-25T04:28:11+09:00
lastmod: 2022-09-12T01:29:18+09:00
tags: ["nvim","neovim"]
categories: ["editor"]
---                                                                         
* Start
  * [nvim install](nvim-install) - nvim 최신버전 설치
  * [nvim features](nvim-features) - nvim 기본 제공 기능들
  * [nvim lua](nvim-lua) - nvim에 기본 내장된 luaJIT 활용과 설정하기
  * [astronvim](astronvim) - 빠른 시작, nvim에 플러그인과 설정을 추가하여 IDE환경 제공

* Plugins - Common

  - packer.nvim -- 플러그인 패키지 관리
  - gruvbox.nvim -- colorscheme 
  - alpha-nvim' -- 시작화면 (startify 대체)
  - nvim-web-devicons -- 파일이나 폴더를 이쁘게 표시해주는 플러그인
  - [nvim-tree](nvim-tree) - lua로 만든 파일 탐색기: NerdTree 대체
  - luatab.nvim - tab 표시 및 관리 (tabline 대체)
  - lualine.nvim - 하단부 라인 표시(airline, powerline 대체)
  - [Comment nvim](Comment.nvim) - 프로그래밍 언어별 주석 처리

* Plugins - Development 개발환경 구성
 
  * nvim-lsp - 각종 언어를 위한 lsp Language Server Protocol 지원 c, rust, ...
  * nvim-cmp - 자동완성
  * neodev.nvim - `lua` 개발 환경 지원 자동완성, 함수 보여주기 등
