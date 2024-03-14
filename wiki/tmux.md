---
title: tmux - 다중 터미널 관리 툴
date: 2022-12-18T13:36:04+09:00
lastmod:
tags: ['tmux','terminal']
categories: ['tools']
---

## Intro
* 다중 터미널 관리 프로그램
* 원격지에서 다양한 세션과 윈도우와 pane을 만들어 유지 관리.
* 다중 작업을 한 터미널 화면을 통해 구현할 수 있다.
* 세션을 유지하며 필요시 화면에 바로 띄울 수 있다.
* 터미널을 꺼도 세션이 살아있고 다시 연결할 수 있다.

## Install
* Debian, Ubuntu
```console
$ sudo apt install tmux
```

* Alpine
```console
$ doas apk add tmux
```

## Usage
* 기본 명령
```console
$ tmux     # 실행
$ tmux ls  # 세션, 윈도우 등 확인  
$ tmux a   # detatch된 세션을 다시 attatch 하기
```

* 기본키(이하 생략) - `Ctrl`+`b`
* 
* + `c` : 새로운 창 열기
* + `w` : 윈도우 관련 동작 프로그램 확인
 
* + `n` : 다음 창 이동
* + `p` : 이전 창 이동
* + `0..9` : 순번으로 창 이동
* + `d` : tmux 나가기(detatch), 다시 연결시 `$ tmux a`

* + `%` : pane 수평 분할
* + `"` : pane 수직 분할
* + `o` : 다른 pane으로 이동

## SETUP
```
$ cat ~/.tmux.conf
## Set the default TERM
set -g default-terminal tmux-256color
## Set Non Login Shell
set -g default-command "${SHELL}"
## Mouse set
set -g mouse on
```

## Links
* git home <https://github.com/tmux/tmux/wiki>
* getting started <https://github.com/tmux/tmux/wiki/Getting-Started>
* faq <https://github.com/tmux/tmux/wiki/FAQ>

