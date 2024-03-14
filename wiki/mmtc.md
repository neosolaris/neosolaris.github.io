---
title: Mmtc
date : 2022-08-23T18:35:04+09:00
lastmod:
tags:
categories:
---
# MMTC: Minimal mpd terminal client
  
## Intro

* Rust로 작성된 심플한 MPD client program
* 현재 느낌으로는 [mpc](mpc)보다 조금 나은 수준이다.

## Install

* 사전에 [mpc](mpc) 먼저 설치해야한다. 
* 이유는 뮤직라이브러리 관리를 지원하지 않기 때문

```console
sudo apt install mpc
git clone https://github.com/figsoda/mmtc.git
cd mmtc
cargo build --release
mv target/release/mmtc ~/bin
mmtc --help
```

## Usage

```
q: quit
r: toggle repeat
R: toggle random
p: pause
;: stop
h or Left: seek backwards
l or Right: seek forwards
H: previous song
L: next song
Enter: play selected song or quit searching mode
Space: select current song
j, Down: go down in the queue
k, Up: go up in the queue
g: go to the top of the queue
G: go to the botton of the queue
/: search
ctrl+u: empty search query
escape: quit serching mode and empty query
```

## Reference

* [mmtc github page](https://github.com/figsoda/mmtc)
* [mmtc-minimal mpd terminal client](https://www.linuxlinks.com/mmtc-minimal-mpd-terminal-client/)
