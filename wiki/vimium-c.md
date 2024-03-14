---
title: vimium-c - Vim like Using firefox
date: 2023-08-26T17:26:57+09:00
lastmod: 2023-08-26T17:27:54+09:00
tags: ['vim','firefox','vimium-c','plugin']
categories: ['firefox']
---

## 설치
- 파이어폭스의 확장기능 검색 : vimium-c
- 플러그인 설치

## 사용법
* `?` : 도움말 보이기/숨기기

* Navigating the current Page:
```
?       show the help dialog for a list of all available keys
h       scroll left
j       scroll down
k       scroll up
l       scroll right
gg      scroll to top of the page
G       scroll to bottom of the page
d       scroll down half a page
u       scroll up half a page
f       open a link in the current tab
F       open a link in a new tab
r       reload
gs      view source
i       enter insert mode -- all commands will be ignored until you hit Esc to exit
yy      copy the current url to the clipboard
yf      copy a link url to the clipboard
gf      cycle forward to the next frame
gF      focus the main/top frame
```

* Navigating to new pages:
```
o       Open URL, bookmark, or history entry, on an English letter "o"
O       Open URL, bookmark, history entry in a new tab, on an English letter "O"
b       Open bookmark
B       Open bookmark in a new tab
```

* Nvigating your history:
```
H       go back in history
L       go forward in history
```

* Manipulating tabs:
```
J, gT   go one tab left
K, gt   go one tab right
g0      go to the first tab. Use `ng0` to go to n-th tab, on `g` and a number character of `0`
g$      go to the last tab
^       visit the previously-visited tab
t       create tab
yt      duplicate current tab
x       close current tab
X       restore closed tab (i.e. unwind the `x` command)
T       search through your open tabs
W       move current tab to new window
<a-p>   pin/unpin current tab
```

* Using marks:
```
ma, mA  set local mark "a" (global mark "A")
`a, `A  jump to local mark "a" (global mark "A")
``      jump back to the position before the previous jump
          -- that is, before the previous gg, G, n, N, / or `a
```

* Additional advanced browsing commands:
```
]], [[  Follow the link labeled "next or ">" ("previous" or "<">)
          - helpful for browsing paginated sites
<a-f>   open multiple links in a new tab
gi      focus the first (or n-th) text input box on the page. Use <tab> to cycle through options.
gu      go up one level in the URL hierarchy
gU      go up to root of the URL hierarchy
ge      edit the current URL
gE      edit the current URL and open in a new tab
zH      scroll all the way left
zL      scroll all the way right
v       enter visual mode; use p/P to paste-and-go, use y to yank
V       enter visual line mode
```

## REFERENCE
* vimium - <https://github.com/gdh1995/vimium>
