---
title: Vis - Combining Modal Editing with Structual Regular Expressions
date: 2022-12-05T08:45:40+09:00
lastmod:
tags: ['vis','vi','editor']
categories: ['ed]itor']
---

## Intro
* vi를 계승하면서도 현재적이고 새로운 코드, 심플하면서도 효과적인 에디터를 지향
* [sam](http://sam.cat-v.org/) 과 structual regular expression 을 도입
* 효과적인 코드 하이라이팅 - Parsing Expression Grammars (Lua LPeg)
* lua Api 제공으로 확장가능 - vim, [nvim](nvim)과는 다르게 vim 설정법을 사용하지 않음
* vimscipt 사용하지 않음, luajit도 사용하지 않음
* 설치 용량이 1MB 내외 (물론 lua5.3도 함께 설치해야한다.)

## 장점과 단점
* 장점
  - 가볍고 빠르다.
  - 기본 명령은 vim의 확장 명령이 아닌 vi의 것을 사용한다.
  - Structual regular expression 지원
  - lua 확장 제공.
  - utf-8 지원

* 단점
  - vim 고유 명령 및 vimscript를 사용하지 않는다. (장점일 수도)
  - vim에서 사용하던 각종 플러그인과 기능을 대부분 지원하지 않는다.
  - vimscript및 문법을 사용하지 않는다. (단점으로 볼수도)
  - encryption, compression, tar, zip, ftp, http, ssh 지원 안함.
  - 단, 플러그인으로 보완할 수 있다.

## Install
* Requirement - 설치 요구사항: 패키지로 설치하는 것이 편리
  - libtermkey
  - curses (recommended)
  - Lua >= 5.2 (for Lua API Support)
  - LPeg >= 0.12 (for syntax highlighting)
  - TRE (optional for more memory efficient regex search)
   
* Source Compile
```console
$ git clone https://github.com/martanne/vis
$ cd vis
$ ./configure && make && sudo make install
```

* Package Install - Ubuntu
```console
$ sudo apt install vis
```

* Package Install - Alpine
```console
# apk add vis
```

## Setup
* `/usr/share/vis/visrc.lua` - 설정 파일 샘플
* `/usr/share/vis/lexers/` - lexers files
* `/usr/share/vis/plugins/` - plugins written in lua
* `/usr/share/vis/themes/` - themes written in lua
* `/etc/vis/visrc.lua` - root sertup file
* `~/.config/vis/visrc.lua` - user setup file

```console
$ mkdir -p ~/.config/vis
$ vis ~/.config/vis/visrc.lua
$ vis hello.c 
:help
```

* `visrc.lua` 설정 예
```lua
require('vis')
vis.events.subscribe(vis.events.INIT, function()
  -- Your global configuration options
  vis:command('set change-256-colors off')
  --keyboard shortcuts--
  vis:command('map insert <C-s> <Escape>:w<Enter>')
  vis:command('map normal <C-s> :w<Enter>')
  vis:command('map! insert <M-C-h> <Escape>dbi')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
  vis:command('set number')
  vis:command('set relativenumbers')
  vis:command('set tabwidth 2')
  vis:command('set expandtab')
  vis:command('set autoindent')
  vis:command('set cursorline')
  vis:command('set colorcolumn')
  vis:command('set ignorecase')
  vis:command('set syntax')
end)
```

## Usage - 기본 명령어
* command options
```console
$ vis -v  # Print version information and exit
$ vis [+command] [--] [files...]  
```
[]()
* [Modes](Modes)
  - normal
  - operator pending
  - insert
  - replace
  - visual

* Undo/Redo
  - `u` - undo
  - `C-r` - redo 
  - `g-`, `:earlier` - restore text earlier
  - `g+`, `:later` - restore text later

* Marks
  - `"` - default mark
  - `'^` - active selections when leaving visual mode
  - `'a-'z` - general purpose marks
  No marks across files are supported. Marks are not preserved over editing sessions  

* Jump list
  - `g<` - jump backward
  - `g>` - jump forward
  - `g<` - save currently active selections

* Registers
  Registers are named list of text. Uninitialzed register slots default to the empty string.
  - `""` - default register
  - `"a-"z` - general purpose registers
  - `"A-"Z` - append to corresponding general purpose registers
  - `"*,"+` - system clipboard integration via shell script vis-clipboard
  - `"0` - yank register, most recently yanked range
  - `"1-"9`,`"&` - sub expression matches of most recent x or y command
  - `"/` - search register, most recently used search pattern
  - `":` - command register, most recentyl executed command
  - `"_` - black hole(/dev/null) register, ignore content is always empty
  - `"#` - selection number(readonly)
  If no explicit register is specified the default register is used.
  
* Macros

* Encoding, Tab and Newline handling
  - UTF-8 encoded with `\n` line endings
  - legacy encodings or non-Unix line endigs: user `iconv`, `dos2unix`
  - `<Tab>` can optionally be expanded to a configurable number of spaces.

* Mouse Support
  - The mouse is currently not used at all

## VI(M) KEY BINDINGS
vi(m)과 거의 같은 키정의를 제공한다. 특별한 경우가 아니라면 큰 문제 없다.

* Operators 
  - `c` - change, delete range and enter insert mode
  - `d` - delete, cut range to register
  - `<` - shift-left, decrease indent
  - `>` - shift-right, increase indent
  - `y` - yank, copy range to register
  - `=` - format, filter range through `fmt`
  - `gu` - make lowercase
  - `gU` - make uppercase
  - `g~` - swap case
  - `J` - join lines, insert spaces in between
  - `gJ` - join lines remove any delimiting white spaces
  - `p` - put register content after cursor
  - `P` - put register content before cursor
  
* Motions
  Motions take an initial file position and transform it to a destination file position, thereby defining a range.
```
0   start of line
b   previous start of a word
B   previous start of a WORD
$   end of line
e   next end of a word
E   next end of a WORD
F⟨char⟩ to next occurrence of ⟨char⟩ to the left
f⟨char⟩ to next occurrence of ⟨char⟩ to the right
^   first non-blank of line
g0  begin of display line
g$  end of display line
ge  previous end of a word
gE  previous end of a WORD
gg  begin of file
G   goto line or end of file
gj  display line down
gk  display line up
gh  codepoint left
gl  codepoint right
gH  byte left
gL  byte right
g_  last non-blank of line
gm  middle of display line
g|  goto column
h   char left
H   goto top/home line of window
j   line down
k   line up
l   char right
L   goto bottom/last line of window
%   match bracket, quote or backtick
}   next paragraph
)   next sentence
N   repeat last search backwards
n   repeat last search forward
[{  previous start of block
]}  next start of block
[(  previous start of parentheses pair
])  next start of parentheses pair
{   previous paragraph
(   previous sentence
;   repeat last to/till movement
,   repeat last to/till movement but in opposite direction
#   search word under selection backwards
*   search word under selection forwards
T⟨char⟩ till before next occurrence of ⟨char⟩ to the left
t⟨char⟩ till before next occurrence of ⟨char⟩ to the right
?pattern to next match of pattern in backward direction
/pattern to next match of pattern in forward direction
w   next start of a word
W   next start of a WORD
```
* Text objects
```
w    word
W    WORD
s    sentence
p    paragraph
[, ], (, ), {, }, <, >, ", ', ` block enclosed by these symbols

gn   matches the last used search term in forward direction
gN   matches the last used search term in backward direction
al   current line
il   current line without leading and trailing white spaces 
```

* Multiple Selections

## VI(M) COMMANDS
* File and Window management
```
:new  새로운 빈창 열기 (수평)
:vnew  새로운 빈창 열기 (수직)
```
* Runtime key mappings
* Keyboard Layout specific Mappings
* Undo/Redo

## SET OPTIONS

## SAM Structural Regular Expression Commands
이것이야말로 lua API와 함께 vis를 사용하는 이유라 할 것이다. 따로 문서를 정리할 예정이며 충분한 연습이 필요하다.
* [vis sre](vis-sre) - Vis Sam Structural Regular Expressions

## Plugin Install and Setup

## TIPS
* vis에서는 line wrap 설정이 따로 없고 default로 적용된다.

## Links
* Github vis - <https://github.com/martanne/vis>
* vis-plugins - <https://github.com/martanne/vis/wiki/Plugins> 
* vis-plugins  - <https://erf.github.io/vis-plugins/>
* sam - <http://sam.cat-v.org/>
* structural regexps - <http://doc.cat-v.org/bell_labs/structural_regexps/>
* sam lang tutorial - <http://doc.cat-v.org/bell_labs/sam_lang_tutorial/>
