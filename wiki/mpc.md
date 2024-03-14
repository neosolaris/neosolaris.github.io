---
title: MPC - Music Player Deamon Client
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-24T03:06:23+09:00 
tags: ["mpc","mpd","utils"]
categories: ["music"]
---

## 소개
* [mpd](mpd)의 client 프로그램으로 간결하다.
* [mmtc](mmtc), [ncmpcpp](ncmpcpp) 도 있으니 참고.

## 사용법

* 아래 환경변수는 `~.bashrc`에 넣어두면 편리하다.

```console
$ export MPD_HOST=192.168.1.100
$ export MPD_PORT=6600
$ man mpc		# 도움말
$ mpc play	# 현재 리스트를 플레이 
```

## Reference
* [Mpc Manual](https://www.musicpd.org/doc/mpc/html)
