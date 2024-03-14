---
title: nvim-tree - File Explorer
date: 2022-09-10T23:52:46+09:00
lastmod:
tags: ["nvim","nvim-tree","plugin"]
categories: ["editor"]
---

* [ ] Cut, copy, paste, rename, delete, create 사용법 추가
* [ ] Git Integration
* [ ] Diagnostic Integration (LSP, COC)
* [ ] Live Filtering
* [ ] 개인화 설정

## 소개

* 빠르고 사용이 편리하며 [nvim](nvim)에서 NerdTree를 대체할 만한 플러그인이다.
* 기능이 아주 많다. 조금씩 공부해서 활용하자.

## 설치

* Add plugin set to `~/.config/nvim/lua/plugins.lua`
```lua
use 'kyazdani42/nvim-web-devicons' -- web-devicons (optional)
use 'kyazdani42/nvim-tree.lua' -- file explorer
```
* Install Package in command line mode
```
:w 
:luafile %
:PackerInstall
```

* Add nvim-tree setup to `~/.config/nvim/lua/settings.lua`
```lua
-- nvim-tree 설정
require'nvim-tree'.setup() -- 설정 로드 및 초기화
nmap('<F2>',':NvimTreeToggle<CR>') -- 토글 키맵 설정
```

* Source `settings.lua` in command line mode
```
:w 
:luafile %
```

## 기본 키매핑

* 자주 쓰는 것만 요약하고 자세한 것은 아래 주소 참조.
  - <https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt>

* `<CR>` - `Enter`: 디렉토리 열기 또는 선택파일 편집
* `<C-v>` - `ctrl` + `v`: 선택 파일 새로운 수직 분할 창에서 편집
* `<C-x>` - `ctrl` + `x`: 선택 파일 새로운 수평 분할 창에서 편집
* `<C-t>` - `ctrl` + `t`: 선택 파일 새로운 탭에서 편집
* `<C-k>` - `ctrl` + `k`: 선택 파일 정보 토글
* `<tab>` - `tab`: 파일 미리보기 (Enter와는 다르게 커서가 nvim-tree에 머뭄) 
* `H` - dotfile 보이기/숨기기
* `g?` - 단축기 도움말 보기 (`q`로도 도움말을 빠져나갈 수 있음)
* `s` - system_open: 해당파일을 관련 어플로 실행하기 (ex. a.html은 firefox 실행)

## Links

* 깃허브 홈: <https://github.com/kyazdani42/nvim-tree.lua>
