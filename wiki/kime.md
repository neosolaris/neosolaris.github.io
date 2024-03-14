---
title: KIME (Korean IME) 한글 입력기
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-24T03:59:21+09:00
tags: ["kime","한글","linux"]
categories: ["한글","linux"]
---

## 설치 및 설정

* 아래한글 한컴오피스는 리눅스용 2020 베타버전이 나와있다.
* 그러나 기존 한글입력기로는 한글입력에 많은 문제가 있다.
* kime은 이 뿐만 아니라 wine등에서 한글입력 문제 등을 해결할 수 있는 방법이다.
* kime의 장점은 매우 간결하고 심플하다는 데 있다.
* 또 다른 장점은 vim 사용시 입력모드에서 한글 사용 중 `esc`로 명령모드로 들어가게 되면 영문으로 자동 변환된다. 한영 전환의 수고가 줄어든다.

```console
# install
sudo dpkg -i kime_debian-buster_v2.5.3_amd64.deb

# setup
sudo mkdir -p /etc/dpkg/kime
sudo cp /usr/share/doc/kime/default_config.yaml /etc/xdg/kime/config.yaml
sudo vim /etc/xdg/kime/config.yaml
#...
#golbal_hotkeys:
#   Super-Space (이하여섯줄 복사해서 바로 위에 붙이고 S-Space로 수정)

im-config -n kime
sudo reboot # 재부팅 후 로그인
$ kime-check
```

## 한컴오피스 2020 베타 리눅스 버전 한글입력을 위한 설정

```bash
$ wget https://github.com/Riey/kime/releases/download/v2.5.2/libkime-qt-5.11.3.so
$ sudo cp libkime-qt-5.11.3.so /opt/hnc/hoffice11/Bin/qt/plugins/platforminputcontexts/
```

## 참고

* 한글이 안되어 이것저것 만지다보면 문제가 생긴다. 
* 다음의 순서대로 설정한다. OS 언어환경을 en으로 유지하는 것이 가장 좋다.
  1. ubuntu 설치를 한글로 진행하면 필요한 폰트나 입력설정이 된다.
  1. 최초 로그인해서 설정>지역&언어로 들어가면 안내하는 필요패키지를 설치한다.
  1. kime 패키지를 설치한다. (sudo dpkg -i kime-xxx.deb)
  1. settings> keybord > input sources에는 English(US)와 Korean만 등록해둔다.
  1. settings> Region&Language > Manage Installed Languages > kime으로 변경
  1. reboot후 확인
* 위에서 키보드에서 Korean을 설정해주어야 indicator 아이콘이 보인다.
* kime으로 변경하면 firefox snap에서 동작하지 않으므로 firefox 재설치 작업

## REFERENCE
  
* [Github Kime](https://github.com/Riey/kime)
* [설치](https://shanepark.tistory.com/318)
* [설치2](https://www.linuxcapable.com/how-to-install-wine-on-debian-11-bullseye)
* [설치3](https://dawoum.tistory.com/88)
* [설치4](http://no1linux.org/board_WEnl84/39530)
