---
title: Vim Startify
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-26T01:39:54+09:00
tags: ["vim","nvim","plugin"]
categories: ["editor"]
---

## Install

```vimrc
Plug 'mhinz/vim-startify'
```

## Key Binding

```vimrc
" `SPC l s` - save current session
nnoremap <leader>ls :SSave<CR>

" `SPC l l` - list sessions / switch to different project
nnoremap <leader>ll :SClose<CR>
```
## Extra Configuration
* 아래 참조하여 더 정리

## 문제점

* [vim](vim) 에서는 잘 되는데 [nvim](nvim) 에서는 구버전(0.6.x), 최신버전(0.7.x) 모두 [vimwiki](vimwiki) 자동저장이 안되는 문제가 있다.

## Reference

* [Github home](https://github.com/mhinz/vim-startify)
* [Project Switcher Using Startify](https://ricostacruz.com/til/project-switcher-using-startify)

