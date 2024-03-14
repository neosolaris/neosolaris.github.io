---
title: Update Raspbian from an Older Version to Buster - 라즈비안 업그레이드
date: 2023-08-26T16:56:05+09:00
lastmod: 2023-08-26T16:56:39+09:00
tags: ['raspbian','update','upgrade','raspberry-pi']
categories: ['raspberry-pi']
---

* 오랫동안 사용했던 음악플레이(mpd) 전용 raspbian을 재설치하지 않고 업그레이드 하는 방법이다.
* 물론 잘 동작하지 않을 수도 있다. 중요 설정파일을 먼저 백업해두고 시작하는 것이 좋겠다.
* 그간의 설정과 환경 구성을 변경하지 않고, 재설치 하지 않고 이를 해결할 수 있다.
* mpc나 기타 클라이언트 프로그램이 최신 mpd (최소 0.21 Version)를 요구하는 것을 계기로 이 문서를 정리하게 되었다.
* 현재의 stretch를 buster로 변경한다.
* 중간 중간에 물어보는 것이 많으니 지켜보고 확인해주어야한다. 시간은 30여분 정도 소요된다.
* 언젠가 새로 설치할 때는 최신 raspios를 설치하고 설정한 후에 문서로 정리할 예정이다.

## Howto
* 아래 두 파일을 stretch -> buster로 변경
```
$ sudo vi /etc/apt/sources.list
$ sudo vi /etc/apt/sources.list.d/raspi.list
$ sudo apt update
$ sudo apt dist-upgrade
$ sudo reboot
...
$ cat /etc/os-release
```

## Reference
- Update Raspberry Pi - <https://phoenixnap.com/kb/update-raspberry-pi>
