---
title: NerdTree
date: 2022-08-26T00:51:41+09:00
lastmod: 2022-09-09T11:52:48+09:00
tags: ["vim","nvim","plugin"]
categories: ["editor"]
---

* 2022.09.09 - tips 추가

## 소개

The NERDTree is a file system explorer for the Vim editor.

vim 환경에서 사용할 수 있는 파일 시스템 탐색기이다.

## 설치

* `~/.vimrc` 또는 `~/.config/nvim/init.vim` 설정

```vimrc
Plug 'scrooloose/nerdtree'
```

* vim
```console
vim +PlugInstall +qall
```
* nvim
```console
nvim +PlugInstall +qall
```

## 설정 및 기능

* `F8`키로 열기/닫기

```vimrc
" nerdtree
nnoremap <F8> :NERDTreeToggle<CR>      "화면에 띄우기: F8키
let g:NERDTreeWinPos = "right"         "화면 오른쪽에 띄우기
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * if !argc() | NERDTree | endif "vim 단독 실행시 실행시키기

```

* `h``j``k``l` - 이동
* `enter` - 폴더열기, 파일열기
* `q` - 나가기
* `h` - 도움말
* `c` - 선택된 디렉토리를 root로 만들기
* `m` - 메뉴
* `I` - 숨은파일(hidden file/dir) 보이기

## Tips

`shift + i` - show hidden dir and files
`/` - Search directories and files form cusor
`s` - open file to split vertically

## Links
* <https://github.com/preservim/nerdtree>
