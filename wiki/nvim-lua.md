---
title: Getting started using Lua in Neovim
date: 2022-08-27T16:25:33+09:00
lastmod: 2023-08-08T15:31:24+09:00
tags: ["nvim","lua"]
categories: ["editor","programming"]
---

* [X] 2023-08-08: 플러그인 수동 설정 추가, 오타 수정
* [X] 2022-09-06: lua의 기본 설정법 및 패키지 설치 설정 정리


## 소개

* nvim은 vim과 다르게 [luajit](luajit) 이 기본 탑재되어 있다.
* 이는 vim의 거의 모든 기능을 [lua](lua)로 제어할 수 있다는 뜻이다.
* 또한 자신의 코드 또는 모듈들을 쉽게 이식하고 확장할 수 있다.
* 이 글의 목표는 기존 `~/.config/nvim/init.vim`의 설정을 모두 `init.lua`로 대체하고 확장하는 데 있다.
* NVIM v0.7.2/ Build type: Release/ LuaJIT 2.1.0-beta3


## Why Lua 5.1 instead of Lua 5.3+?

* 아래는 nvim 공식 FAQ 내용이다.
* 따라서 [LuaJIT](luajit) 과 함께 별도의 프로그래밍시 [lua](lua) 에서도 버전을 5.1로 맞추어 사용하는 것이 여러모로 좋다고 생각한다.

    > Lua 5.1 is a different language than 5.3. The Lua org makes breaking changes with every new version, so even if we switched (not upgraded, but switched) to 5.3 we gain nothing when they create the next new language in 5.4, 5.5, etc. And we would lose LuaJit, which is far more valuable than Lua 5.3+.

    > Lua 5.1 is a complete language. To "upgrade" it, add libraries, not syntax. Nvim itself already is a pretty good "stdlib" for Lua, and we will continue to grow and enhance it. Changing the rules of Lua gains nothing in this context.

## Nvim Lua 설정 및 설치 구조

기본 설정 파일은 `init.lua`이며 모두 이곳에 설정해도 된다. 그러나 차차 설정 내용이 많아지고 복잡해질 수 있으므로 따로 분리해서 관리하는 것이 좋겠다.

* 설정파일

```console
~/.config/nvim/init.lua         # nvim 기본 설정파일
~/.config/nvim/lua/             # 확장 설정 및 모듈 추가 디렉토리
~/.config/nvim/lua/plugins.lua  # packer 및 플러그인 등록 설정파일
~/.config/nvim/lua/settings.lua # nvim 확장 설정파일
~/.config/nvim/lua/mymodule.lua # 개인 모듈 또는 설정파일

~/.local/share/nvim/site        # 각종 플러그인 설치 위치
```

* 설정 방법

    * nvim 7.x 버전 기준으로 일반 사용자 설정파일은 `~/.config/nvim/init.lua`이다.
    * 기존에 `~/.config/nvim/init.vim`이 우선권을 갖는다. 있다면 다른 곳에 백업해 둔다.
    * 또는 `init.vim`에 `lua require('init')`이라고 추가해준다.
    * `init.lua`는 당연히 `lua`프로그램이므로 루아 문법에 맞게 작성해야 한다.
    * 이제 깨끗한 백지에 한자씩 정성스럽게 글을 쓰듯 설정을 해나간다.
    * 주의할 것은 초기 설정을 너무 많이 작성하고 확인하면 에러 찾기가 어려우므로 한 부분 설정하고 확인하는 방식으로 하자.

* `~/.config/nvim/init.vim`
```lua
require('plugins') -- 플러그인 설정: lua/plugins.lua 를 불러옴
require"settings" -- 주 설정: "" 형식도 허용 lua/settings.lua
require'mymodule' -- ''가 보다 간결 lua/mymodule.lua
```

## 기본 설정
* 설정은 `vim.option.옵션명 = '값'` 형태로 `vimrc` 변수를 사용한다.
* 축약형 `vim.o.옵션명`을 사용해도 된다.

* `~/.config/nvim/lua/settings.lua`
```lua
-- basic set
vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.autoindent = true
vim.o.smartindext = true
vim.o.shiftwidth = 4 
vim.o.tabstop = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.backspace = 'indent,eol,start'
vim.o.cursorline = true
vim.o.spell = true

-- colorscheme set
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
```

## 플러그인 수동 설치
* System Wide: /usr/share/nvim/site/
* System Wide(lua): /usr/share/nvim/site/lua/
* User: ~/.local/share/nvim/site
* User(lua): ~/.local/share/nvim/site/lua/
* 해당 디렉토리에 원하는 플러그인을 `git clone`으로 복사한다.
* `~/.config/nvim/init.lua` 에 설정을 추가한다.
* 재실행하거나 `:so %`로 설정을 리로드한다.
* 번거롭지만 이렇게 구성해 놓고 백업해 두거나 Github에 설정파일과 함께 올려 두면
  바로 사용 가능하다.

## Packer - 플러그인 메니저 설치
* nvim-lua 에서는 플러그인 메니저로 packer를 가장 많이 사용하므로 이를 채택.
* Packer도 플러그인이므로 먼저 설치되어야 한다.

* Packer설치 - `~/.local/share/nvim/site` 이하 설치를 기억.
```console
$ git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Packer 설정 및 플러그인 설치
* 플러그인은 가급적 내장 LuaJIT을 활용한 루아 플러그인으로 대체한다.

* 플러그인 등록 - `~/.config/nvim/lua/plugins.lua`
```lua
vim.cmd [[packadd packer.nvim]]                 -- vim.cmd로 packadd 시작

return require('packer').startup(function(use)  -- packer 시작
  -- Packer can manage itself       
  use 'wbthomason/packer.nvim'                  -- packer 플러그인 사용
  
  -- common
  use 'ellisonleao/gruvbox.nvim'                -- colorscheme 플러그인 추가
  use 'kyazdani42/nvim-web-devicons'            -- web-devicons
  use 'kyazdani42/nvim-tree.lua'                -- file explorer
  use 'alvarosevilla95/luatab.nvim'             -- tab line 
  use 'nvim-lualine/lualine.nvim'               -- line status 
  use 'goolord/alpha-nvim'                      -- alpha-nvim starter
  
end)                                            -- packer 종료
```

* 플러그인 설치 - nvim의 last line mode에서 실행
    * `:luafile %` - 현재 루아 설정파일 재인식
    * `:PackerInstall` - Packer로 등록한 플러그인 설치
```console 
:luafile %
:PackerInstall
```
* 플러그인 설정 - `~/.config/nvim/lua/settings.lua`
    - 설정은 `require'plugname'.setup()` 형식이고, `setup()`은 default set이다.
    - 자주쓰는 플러그인 명령을 자신에 맞게 리매핑을 추가
    - 설정에 관한 정보는 각 플러그인 홈페이지에서 확인
    
```lua
-- nmap setting 자주 사용하는 단축키 재지정 함수 정의
function nmap(short, command)
    vim.api.nvim_set_keymap('n', short, command, {noremap = true, silent = true})
end     

-- gruvbox colorscheme - https://github.com/ellisonleao/gruvbox.nvim
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')

-- nvim-tree - https://github.com/kyazdani42/nvim-tree.lua 
require'nvim-tree'.setup()
nmap('<F2>',':NvimTreeToggle<CR>')

-- luatab.nvim - https://github.com/alvarosevilla95/luatab.nvim
require("luatab").setup()
nmap('<',':tabp<CR>')
nmap('>',':tabn<CR>')
nmap('N',':tabnew<CR>')

-- lualine.vim - https://github.com/nvim-lualine/lualine.nvim
local custom_gruvbox = require'lualine.themes.gruvbox'
-- Change the background of lualine_c section for normal mode
custom_gruvbox.normal.c.bg = '#112233'
require('lualine').setup {
options = { theme  = custom_gruvbox },
...
}

-- alpha-nvim stater
--require'alpha'.setup(require'alpha.themes.dashboard'.config)
nmap('<F12>',':Alpha<CR>')
require'alpha'.setup(require'alpha.themes.startify'.config)
```
* 설정 재인식
```
:luafile %
```

## lua 사용팁 정리
* 명령라인에서
```
- executes a single code
:help :lua
:help :lua-heredoc
:lua local foo = 1
:lua print(foo)  --> nil 출력
:lua requre('myluamodule')
:lua <<EOF
local foo = 1
print(foo) --> 1 출력
EOF

- executes a chunk of Lua code
:help :luado
:luado return 'hello world'
:luado if linenr % 2 == 0 then return line:upper() end

- sourcing lua files
:luafile ~/foo/bar/myluafile.lua
:luafile %
:source {luafile|%}
:runtime {luafile|%}
```

* vim name space
    * `vim.api`
    * `vim.o` or `vim.opt`
    * `vim.bo`
    * `vim.go`
    * `vim.cmd` - `command-mode`의 모든 명령을 복수로 실행할 수 있다.
    * `vim.inspect`
    * `vim.loop`
    * `vim.lsp`
    * `vim.regex`
    * `vim.treesitter`
    * `vim.ui`
    * `vim.wo`
    
* Using meta-accessors
    * `vim.g` - global variables
    * `vim.b` - buffer variables
    * `vim.w` - window variables
    * `vim.t` - tabpage variables
    * `vim.v` - predefined Vim variables
    * `vim.env` - environment variables

## 미해결 과제들

* `vim.cmd`를 이용하여 `abbr` 명령을 쓰고 있는데 lua로 보다 우아하게 사용할 방법 모색.
* vimwiki의 자동저장 `vimwiki_autorewrite`가 nvim에서는 적용되지 않고 마지막에 'q'로 빠져 나올 때에 버퍼가 저장된다. dev 버전 재설치, 설정 변경 등의 시도를 해 보았으나 여전히 문제. 그렇다고 nvim의 autorewrite를 적용하면 해결되지만 모든 버퍼에 대해 자동 저장을 하므로 이는 내가 원치 않는 것이다.
* 키매핑을 할 때 플러그인 들에 대한 숙지가 되어 있지 않아 충돌 문제가 발생한다. 조금씩 공부해서 이 문제를 해결하자.

## 참고 사항

* 이렇게 기본적인 사항을 알아보았다.
* 물론 `init.lua`에 모두 넣어도 상관없다. 다만 Packer설정은 return문이므로 다른 설정이 그 아래로 들어가면 안된다.
* lua를 사용하면 더욱 더 nvim이 강력해지고 빨라진다.
* 자신의 모듈이나 환경설정을 보다 다양하고 정교하게 할 수 있다.
* 이제는 여러 플러그인을 자신의 목적에 맞게 추가하고 적용하는 일만 남았다.
* 각 플러그인에 관한 것은 하나씩 문서로 올릴 예정.
* 다음의 훌륭한 링크들을 참조한다.

## Links
* Getting started using Lua in Neovim - 다소 내용이 많은 입문서
  - <https://github.com/nanotee/nvim-lua-guide>
* Everything you need to know to configure neovim using lua 
  - <https://dev.to/vonheikemen/everything-you-need-to-know-to-configure-neovim-using-lua-3h58>
* From init.vim to init.lua - a crash course - 실사용례, 핵심만 전달
  - <https://www.notonlycode.org/neovim-lua-config/>
* Packer 홈 - 플러그인 메니저 
  - <https://github.com/wbthomason/packer.nvim>
* Top Neovim plugins for developers in 2022
  - <https://hannadrehman.com/top-neovim-plugins-for-developers-in-2022>
