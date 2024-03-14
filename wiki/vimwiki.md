---
title: Vimwiki
date: 2022-08-23T18:35:04+09:00
lastmod: 2023-09-01T00:26:02+09:00
tags: ["vim","nvim", "markdown","vimwiki","plugin"]
categories: ["editor"]
---

* 2023-08-31: 오타 수정, `할일과 일기` 항목 내용 추가
* 2023-08-04: nvim에서의 설정 추가, 오타 및 링크 수정
* 2022-09-12: vimwiki cheatsheet 링크 추가

## vim에서 설치

* [vim](vim)의 vimwiki 플러그인을 설정 추가하고 설치한다.
```console
vim ~/.vimrc
```

* 설정 추가 내용
```vimrc
"vimwiki 플러그인
Plug 'vimwiki/vimwiki', {'branch': 'dev'} 
"vimwiki의 편한 시작을 위한 vim starter tool
Plug 'mhinz/vim-startify'
```

* 플러그인 설치
```console
$ vim +PluginInstall +qall
```

## vim에서 설정

```console
$ vim ~/.vimrc
```

```vimrc
" vimwiki 설정
" 공개용 위키(github와 연동), 개인용 위키 두개를 설정(gdrive, dropbox 연동)
let g:vimwiki_list = [
	\{
	\   'path': '/data/vimwiki/wiki',
	\   'syntax' : 'markdown',
	\   'ext' : '.md',
	\   'diary_rel_path': '.',
	\},
	\{
	\   'path': '/data/vimwiki/mywiki',
	\   'ext' : '.md',
	\   'diary_rel_path': '.',
	\},
	\]
" vimwiki의 conceallevel 을 끄는 것이 좋다
let g:vimwiki_conceallevel = 0
" vimwiki 설정이 markdown 설정을 침투하지 않게 하기
let g:vimwiki_global_ext = 0  
```

## Neovim에서 설치
* 플러그인 등록: `~/.config/nvim/lua/plugins.lua`
```lua
    use {'vimwiki/vimwiki'}
```
* 플러그인 설치: nvim 내에서
```
:PackerInstall
```

* 플러그인 설치: shell 내에서
```console
$ nvim +
$ nvim +PluginInstall +qall
```

## Neovim에서 설정

* 설정: `~/.config/nvim/lua/settings.lua`

```lua
-- vimwiki - https://github.com/vimwiki/vimwiki 
----------------------------------------------------------------
vim.cmd([[
iabbr __email abcd@efgh.com
iabbr <expr> __time strftime("%Y-%m-%d %H:%M:%S")
iabbr <expr> __date strftime("%FT%R:%S+09:00")
iabbr <expr> __today strftime("%F")
iabbr <expr> __file expand('%:p')
iabbr <expr> __name expand('%')
iabbr <expr> __pwd expand('%:p:h')
iabbr <expr> __front system("/home/borisu/bin/frontmatter.sh")
iabbr <expr> __luajit '#!/usr/bin/env luajit'
]])

-- Key Mapping
nmap('<C-l>', ':VimwikiToggleListItem<CR>') -- Contol + Space is default
-- vim.g.vimwiki_autowriteall = true        -- automatically save a modified wiki buffer
-- vimwiki의 conceallevel 을 끔
vim.g.vimwiki_conceallevel = 0
-- vimwiki 설정이 markdown 설정을 침투하지 않게 하기
vim.g.vimwiki_global_ext = 0                -- 모든 마크다운에 대해 동작하지 않도록 함

vim.g.vimwiki_list = {
  {
     path = '$HOME/vimwiki/',
     syntax = 'markdown',
     ext = '.md',
     diary_rel_path = '.',
  }
}
```

* 재인식
```
:luafile %  -- 또는
:so %
```

## 기본 키정의

* `:h vimwiki-local-mappings` -- See default key binding
* `:h vimwiki-mappings` -- See many more bindings.

* `\ww` -- Open default wiki index file (Default: ~/vimwiki/index.wiki)
* `\wt` -- Open default wiki index file in a new tab
* `\ws` -- Select and open wiki index file. (1.wiki -> 2.mywiki)
* `\wd` -- Delete wiki file you are in.
* `\wr` -- Rename wiki file you are in.
* `<Enter>` -- Follow/Create wiki link.
* `<Shift-Enter>` -- Split and follow/create wiki link.
* `<Ctrl-Enter>` -- Vertical split and follow/create wiki link.
* `<Backspace>` -- Go back to parent(previous) wiki link.
* `<Tab>` -- Find next wiki link.
* `<Shift-Tab>` -- Find previous wiki link.

## 명령어

* `:Vimwiki2HTML` -- Convert current wiki link to HTML.
* `:VimwikiAll2HTML` -- Convert all your wiki links to HTML.
* `:help vimwiki-commands` -- List all commands.
* `:help vimwiki` -- General vimwiki help docs.

## 위키검색

* `:VWS /검색어/` -- 위키내 검색어를 포함하는 모든 위키 검색
* `:VWB /검색어/` -- 현재 위키를 링크하고 있는 모든 위키 검색
* `:lopen` -- 검색된 위키 리스트를 출력 

* 검색자동화 '~/.vimrc'

```vimrc
" F1 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F1> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>
" F2 키를 누르면 현재 문서를 링크한 모든 문서를 검색한다              
nnoremap <F2> :execute "VWB" <Bar> :lopen<CR>
```

## 할일과 일기

* 아래 명령어들을 자주 사용한다면 nmap에 키매핑해서 사용하면 편리하다.
* `Ctrl + Space` 로 체크박스를 자동생성하고 체크표시를 할 수 있다.
* `:VimwikiMakeDiaryNote`로 오늘 날짜의 일기를 만들 수 있다.
	* 예) 2022-08-12.md
* `:VimwikiDiaryIndex` - Diary index로 가기
* `:VimwikiDiaryGenerateLinks` - Diary Generate (반드시 Diary Index 페이지에서 수행)
* `:VimwikiDiarTomorrowDiaryNote` - 내일 일기 생성
* `:VimwikiDiarYesterdayDiaryNote` - 어제 일기 생성

## Vimwiki와 Github.io 연결해서 사용하기

* 깃허브에서 user-name.github.io 저장소를 git clone 으로 로컬에서 가져온다.
* vimwiki로 로컬폴더를 `~/.vimrc`에 등록해준다.
* 문서를 index.md로 시작하여 위키문서를 작성한다.
* 이를 github에 올리고 브라우저에서 user-name.github.io 주소로 확인한다.
* 주의할 점은 index.html이 있는 경우 우선권을 가지므로 index.html을 지우거나 index.md로 연결하도록 해주어야 한다.
* github.io의 무료 위키관리 시스템이 있으나 위 방법으로 그냥 써도 무방하다.
* 보다 자세한 문서는 [VimWik Hugo Github.io 연동](vimwiki-hugo-github)문서를 참조.

## Reference

* Vimwiki 사용법: https://johngrib.github.io/wiki/vimwiki/
* Vimwiki Home: https://github.com/vimwiki/vimwiki
* vimwiki cheatsheet: http://thedarnedestthing.com/vimwiki%20cheatsheet
