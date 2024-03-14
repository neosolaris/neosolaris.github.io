---
title: Comment.nvim - nvim 주석처리 프로그램
date: 2023-08-10T17:50:37+09:00
lastmod:
tags: ['comment', 'nvim', 'plugin', 'devel']
categories: ['nvim']
---

## Intro
- 프로그래밍 환경에서 각 언어별 주석처리를 쉽게 추가 제거 할 수 있는 플러그인
- 관련 플러그인 중에 가장 인기가 많고 사용이 편리하다.

## Features
- Supports treesitter.
- Supports commentstring. Read :h comment.commentstring
- Supports line (`//`) and block (`/* */`) comments
- Dot (`.`) repeat support for `gcc`, `gbc` and friends
- Count support for [count]gcc and [count]gbc
- Left-right (`gcw` `gc$`) and Up-Down (`gc2j` `gc4k`) motions
- Use with text-objects (`gci{` `gbat`)
- Supports pre and post hooks
- Ignore certain lines, powered by Lua regex

## Install
- With packer.nvim
```lua
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
```

- Manual Install
```console
$ cd ~/.local/share/nvim/site
$ git clone https://github.com/numToStr/Comment.nvim
$ cp Comment.nvim/plugin/Comment.lua plugin/
$ cp -r Comment.nvim/lua/Comment lua/

$ vi ~/.config/nvim/init.lua
...
lua require('Comment').setup()
:so %
```

## REFERNCE
* Comment.nvim Github: https://github.com/numToStr/Comment.nvim
