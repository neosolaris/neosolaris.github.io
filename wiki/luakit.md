---
title: Luakit - lua 기반 웹브라우저
date: 2022-12-09T07:07:46+09:00
lastmod: 2022-12-24T07:56:42+09:00
tags: ['luakit','browser']
categories: ['browser']
---

## Intro

A fast, extensible, and customizable web browser
* 빠르고 다양한 확장과 설정이 가능한 웹 브라우저
* Lua 기반 설정으로 개인환경을 구축하기에도 좋다.
* vi(m)을 사용하는 데 익숙하다면 더욱 편리하게 사용할 수 있다.
* 가령, vi와 같이 normal, command line, insert mode를 제공한다.

## Install
* Ubuntu, Debian
```console
$ sudo apt install luakit
```

## Build - Ubuntu/Debian
  
* Pre Requirement
```console
$ sudo apt install libgtk-3-dev libwebkit2gtk-4.0-dev libgstreamer1.0-dev
```

* Build
```console
git clone https://github.com/luakit/luakit.git
cd luakit
make
sudo make install  # /usr/local/bin
```

## Quick-start Guide

* Using Luakit
```console
$ luakit -h
$ luakit google.com
```

* 주요 명령어
```
i — insert mode.
: — command mode.
Ctrl-z — passthrough mode.
o — open URL.
t — open URL in new tab.
w — open URL in new window.
d/Ctrl-w — close tab.
D/ZQ — close window.
ZZ — save session and close window.
```

* 도움말 및 관련 문서 보기
- `<F1>` - normal mode
- `:help` - command line mode

* 웹브라우징 - 사이트 열기 및 이동
- `:open URL` - command line mode
- `o` + URL입력 - normal mode (하단 command line에 입력)
- `:tabopen URL` - open URL in a new tab
- `:winopen URL` - open URL in a new window
- `H` - 이전 페이지로 이동
- `J` - 이후 페이지로 이동

* 페이지 내 이동 및 페이지 키워드 검색
- `h`,`j`,`k`,`l` - 페이지 내 상하좌우 이동
- `<space>`, `<Ctrl-f>` - 다음 화면 아래 이동
- `<Ctrl-b>` - 이전 화면 위로 이동
- `0`, `gg` - 페이지 맨 처음으로
- `G` - 페이지 맨 끝으로
- `/ Keyword` - 페이지 내에서 Keyword 찾기
- `n`,`N` - 다음 Keyword, 이전 Keyword 이동
- `i` - 입력(편집) 모드
  - `<Tab>` - 페이지 내 아래로 링크이동
  - `<Shift-Tab>` - 페이지 내 위로 링크이동

* 탭간 이동 및 제어
- `:tabopen URL` - 새로운 탭으로 URL 열기
- `d` - 현재 탭 닫기
- `u` - 닫은 탭 다시 열기
- `J` - 이전 탭으로 이동
- `K` - 이후 탭으로 이동

* Bookmarks
- `B` - 현재 페이지 북마크 추가
- `gb` or `gB` - 현재 탭 또는 새로운 탭에 북마크 페이지 열고 사이트 연결

## Configuration - 설정

* Lua 설정 파일 우선 순위
- luakit을 실행한 현재 디렉토리
- lua 파일이 설치되어 있는 시스템 디렉토리: ex) `/usr/lib`, `/usr/local/lib`
- luakit 설치 파일 위치: `/usr/share/luakit/lib/`
- luakit 사용자 디렉토리: `~/.config/luakit/`
- 시스템 설정 디렉토리: `/etc/xdg/luakit/`

위의 리스트를 확인하려면 luakit 브라우저에서 다음과 같이 확인할 수 있다.
```lua
:lua w:notify(package.path:gsub(";","\n"))
```

* 일반 사용자 설정
- `~/.config/luakit/userconf.lua` 설정
- 사용례 - 웹페이지 내 문자열 복사 명령을 `<Ctrl-c>`로 수정하기

```lua
--- userconf.lua

local modes = require "modes"

modes.add_binds("normal", {{
    "<Control-c>",
    "Copy selected text.",
    function ()
        luakit.selection.clipboard = luakit.selection.primary
    end
}})

-- maps "<Control-p>" to the same action as "gT" (go to previous tab), and
-- keeps "gT" binded as well
modes.remap_binds("normal", {
    {"<Control-p>", "gT", true}
})
```

## Tips
* 현재 페이지의 URL을 복사하려면 - 하단 URL 표시를 3-click 하여 `<Ctrl-c>`
* 테마를 바꾸려면 테마를 가져와 `theme.lua`로 심볼릭 링크해서 사용한다.
```
$ cd ~/.config/luakit/
$ git clone https://github.com/twnaing/base16-luakit.git
$ ln -s base16-luakit/themes/base16-gruvbox-dark-soft.lua theme.lua $ cp /etc/xdg/luakit/rc.lua ~/.config/luakit/
$ luakit &
```

* 다크모드 설정
```
:settings
application.prefer_dark_mode -> enabled
```
설정 후 브라우저 재실행

## 문제해결
* 다크모드: 현재 최신버전 2.3 (Ubuntu Package Version), 2.3.3 (Source Build Version) 모두 darkmode 가 되지 않는다. 설정을 하고 재실행 해도 안된다.
* 화면 초기에 white flash 현상은 webkit 자체에서 초기 화이트 랜더링으로 설계되어서 당장 없애기는 불가능하다. 
* youtube의 영상도 동작하지 않음. 플레이에 적당한 브라우저가 아니라고 나온다. 물론 libgstreamer를 설치해 주었지만 소용이 없다.
* 이 점만 개선되면 더 이상 바랄게 없으나 페이지마다 눈이 부셔서 오래 웹서핑을 하고 문서 등을 참고할 때 피곤하다. 당문간 firefox와 병행해서 써야겠다.

## Links
* Luakit Quick Start <https://luakit.github.io/docs/pages/03-quick-start-guide.html>
* Luakit FAQ <https://luakit.github.io/docs/pages/02-faq.html>
