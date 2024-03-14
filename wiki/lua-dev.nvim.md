---
title: lua-dev.nvim - nvim에서 lua 개발 환경 구성 플러그인
date: 2022-09-12T01:31:36+09:00
lastmod: 2022-10-31T17:56:59+09:00
tags: ["nvim", "lua", "plugin"]
categories: ["editor"]
---

## Intro
* lua로 프로그래밍을 할 때 함수나 자동완성을 도와주는 플러그인이다.
* nvim의 lua 내장함수 및 api도 지원한다.
* 다른 lsp 서버의 설치와 설정보다 어려워서 많이 고생했다.
* 가장 중요한 것은 lua-language-server를 제대로 설치하는 것이다.
* 서버를 컴파일 하는 것보다는 바이너리를 다운 받아 쓰는 것을 권장한다.

## Requirements
* nvim-cmp :자동완성 플러그인
* nvim-lsp :Language Server Protocol 플러그인
* cmp-nvim-lsp : lsp 자동완성 지원 플러그인
* sumneko lua-language-server : Lua lsp server 프로그램 (lua 5.1 ~ 5.4, luaJit 모두 지원)

## lua-language-server Install
* 아래에서 컴파일된 바이너리 다운로드 (리눅스 64bit기준)
* <https://github.com/sumneko/lua-language-server/releases>
* 적당한 위치에 설치

```console
$ mkdir ~/data/lua-language-server && cd lua-language-server
$ tar xvfz ~/Download/lua-language-server-3.5.5.tar.gz .

$ cat <<EOF > ~/bin/lua-language-server  # 실행스크립트 작성
#!/usr/bin/bash
exec "~/data/lua-language-server/bin/lua-language-server" "$@"
EOF

$ chmod u+x ~/bin/lua-language-server # ~/bin 이 PATH에 설정되어 있어야
$ lua-language-server --version       # 에러 없이 버전이 출력되면 성공
```

## lua-dev Install
* 먼저 nvim-cmp nvim-lsp, cmp-nvim-lsp가 설치 및 설정되었다고 가정한다.

* `~/.config/nvim/lua/plugins.lua` 플러그인 설정 추가
```lua
-- For lua devel
use "folke/lua-dev.nvim"
```

* 플러그인 설치
```
:w
:luafile %
:PackerInstall
```

* `~/.config/nvim/lua/settings.lua` 설정
```lua
-- lua-dev
-- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
require("lua-dev").setup()

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')

-- example to setup sumneko and enable call snippets
lspconfig.sumneko_lua.setup({
  Lua = {
    completion = {
      callSnippet = "Replace"
    }
  }
})

```

* 적용하기 (또는 종료 후 다시 시작)
```
:luafile %
```

## 주의 사항
* auto-complete가 작동하지 않는 가장 큰 이유는 `sumneko_lua`를 제대로 설치하지 않아서이다.
* `nvim-cmp`의 설정에 위의 `sumneko_lua` 설정이 중복되지 않도록 한다.

## Links
* lua-dev Git Home 
  * <https://github.com/folke/lua-dev.nvim>
* sumneko lua-language-server Git Home
  * <https://github.com/sumneko/lua-language-server/>
* sumneko lua-language-server Download
  * <https://github.com/sumneko/lua-language-server/releases>
* sumneko lua-language-server Getting Started
  * <https://github.com/sumneko/lua-language-server/wiki/Getting-Started>
