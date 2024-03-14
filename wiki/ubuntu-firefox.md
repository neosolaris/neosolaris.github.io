---
title: Ubuntu firefox
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-12-24T08:41:10+09:00
tags: ["ubuntu","firefox"]
categories: ["www"]
---

# Ubuntu 22.04 LTS 환경에서 Firefox 재설치 및 설정

## Intro

* 우분투 22.04에서 firefox는 snap으로 설치된다.
* 문제는 한글입력기 kime으로 설치했을때 snap firefox는 한글 입력이 안된다.
* 다른 문제는 우분투 윈도우 환경에서 top bar를 숨길 수 없다.
* 달리 말하면, gnome-shell을 설치하고 관련 플러그인을 모두 쓸 수 없다는 것.

## snap firefox uninstall
```console
sudo snap remove firefox
```

## Add Mozilla Team PPA and Install

* 모질라팀 저장소를 추가한다. 
```console
sudo add-apt-repository ppa:mozillateam/ppa
```
* 우선권을 주어 snap firefox가 설치되지 않도록 한다. (오타가 없도록 주의)
```console
sudo vim /etc/apt/preferences.d/mozillateamppa
```

```
Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
```
* apt update & install
  
```console
sudo apt update
sudo apt install firefox
```

## Enable Top Panel Auto-Hide

* Install gnome-shell
```console
sudo apt install chrome-gnome-shell gnome-shell-extension-prefs
```
* Install extension
firefox 실행 후 gnome shell extension을 먼저 설치한다.
extension > hide top bar 검색 후 설치(Click to change: ON)

## 참고
* kime dev pkg v2.5.6 설치 후 우분투윈도우 입력기를 kime으로 수정.
```
settings> Region & Language> Manage Installed Languages > Keyboard input method system: kime
```
* 로그아웃 후 다시 로그인하면 터미널 및 firefox에 모두 한글 가능
* top bar도 창이 접촉하면 자동으로 숨겨진다. 화면 공간이 더욱 여유가 생겼다.
* ubuntu에서 업데이트 후 한글 입력이 안되는 경우
  - firefox가 snap으로 자동 업그레이드 된다. 이로 인해 많은 문제 발생
  - local 디렉토리 중 OS외의 파티션을 firefox에서 브라우징 할 수 없다.
  - 한글 입력이 안된다.
  - snap remove 으로 firefox를 제거하고 ppa 저장소로 부터 재설치한다.
  - snap이 위의 ppa priority를 무시할 경우가 있으므로 사용하지 않는 경우 데몬을 중지시킨다.
  - `$ sudo systemctl stop snapd`

## Reference

* Firefox install ubuntu-22.04
<https://ubuntuhandbook.org/index.php/2022/04/install-firefox-deb-ubuntu-22-04/>
* Autohide Top-topbar ubuntu-22.04
<https://ubuntuhandbook.org/index.php/2020/08/top-panel-auto-hide-ubuntu-20-04/>

