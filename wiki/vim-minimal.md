---
title: 플러그인 없이 vim을 최소 설정으로 사용하기
date: 2023-09-16T16:33:03+09:00
lastmod: 2023-09-16T16:33:33+09:00
tags: ['vim','minimal','vimrc']
categories: ['editor']
---

* 원격지에서 vi(m)을 사용할 때 간단한 편집은 괜찮으나 코드를 수정하거나 할 때에는 불편하다.
* 하지만 플러그인과 많은 설정을 할 경우 번거롭기도 하고 무거워지기도 한다.
* 한가지 방법은 로컬의 환경에서 scp를 이용해 편집하는 방법이다. [nvim scp](nvim-scp) 참조.
* 또 다른 방법은 아주 불편하지 않는 선에서 환경을 설정하고 사용하는 방법이다.
* 이 경우 플러그인 사용을 하지 않고, 최소한의 설정만 하는 것이다.
* 장점은 가볍고 빠르면서 환경설정도 최소한으로 할 수 있어 편리하다.
* 특히 원격지가 저사양 컴퓨터이거나 라즈베리파이 등일 때 적당하다.

## Setup
* how to setup
```
# Install vim or nvim
sudo apt install vim

# Setup for (v)vim
vi ~/.vimrc

# Use
vi ~/myproject/myfile.c
```
* `.vimrc`
```
"
" minimal vimrc with no (extra) plugins
"

"load system defaults
if filereadable(expand('$VIMRUNTIME/defaults.vim'))
	unlet! g:skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

"regular settings
"----------------
" ui
set number
set ruler
set wildmenu
set showcmd
set showmatch

" encoding/format
set encoding=utf-8
set fileformats=unix,dos,mac

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" key timeout values
set esckeys
set ttimeoutlen=20
set timeoutlen=1000

" allow syntax and filetype plugins
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

" autocmds
"---------
augroup general
    autocmd!
    "keep equal proportions when windows resized
    autocmd VimResized * wincmd =
    "save cursor position in a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
                \ <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup languages
    autocmd!
    autocmd BufNewFile,BufRead *.bash set syntax=sh
    autocmd FileType python xnoremap <leader>r <esc>:'<,'>:w !python3<CR>
    autocmd FileType go set noexpandtab
    autocmd FileType html :syntax sync fromstart
    autocmd FileType html,javascript,css,json,yaml,sh
                \ setlocal ts=2 sts=2 sw=2 expandtab
augroup END
```

## REFERENCE
* A minimal Vimrc - https://madjam.dev/posts/a-minimal-vimrc/
