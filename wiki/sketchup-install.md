---
title: Sketchup2017 Install and Setup in Ubuntu
date: 2022-08-29T18:15:44+09:00
lastmod: 2023-11-01T16:42:26+09:00
tags: ['wine','sketchup','ubuntu','스케치업']
categories: ['3d-modeling']
---

## 설치시 고려사항

* 설치환경
```
Ubuntu 22.04
SketchupMake2017 version
OpenGL 3.X 이상
WineHQ 최신버전
```
* 윈도우를 전혀 사용하지 않거나 꺼려지데 sketchup을 쓰고 싶다면 참고한다.
* 루비 플러그인이 오작동 없이 사용 가능한 버전인가.
* OpenGL 버전을 만족하는 그래픽 카드를 가지고 있는가.
* 한글 입출력이 문제가 없는가.
* 무료 버전 중 가장 최근의 sketchup은 무엇인가.
* 결론: `SketchupMake2017 + winehq + linux`

## Intro

* 우분투, 데비안에서 설치 테스트 완료 `debian Jessie 8.11`, `ubuntu jammy 22.04`
* 기존 wine 패키지 버전 6.x에서는 실패, winehq 최신 버전으로 성공
* winehq: `staging 7.14` version
* 스케치업버전은 2017 이상으로 해야 플러그인 설치 및 활용가능
* 스케치업2017까지가 마지막 Free 버전(SketchupMake-2017)이므로 이를 선택
* `sketchup: 2017 make version: 2018.08.25 release`
* 한글입출력문제: winehq설치 후 `gulim.ttc` 파일을 추가해준다. 

## Winehq Install 

* add repository first, staging version 7.14 success

```console
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main'
sudo apt-get update
```

```console
sudo apt install --install-recommends winehq-staging
wine --version
```

## Winetricks (version:20220411) Install

* winetricks 최신버전을 다운로드한다.
```console
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod u+x winetricks
mv winetricks ~/bin
winetricks --version
```
## Sketchup2017 Install

* winetricks를 이용하여 CLI환경에서 자동으로 설치할 수 있다.
* 그러나 중간 중간 라이센스 동의 후 설치확인을 해 주어야한다.
* dotnet 설치과정에서 reboot할 거냐고 물으면 later로 해준다.
* 설치전 반드시 환경변수를 `~/.bashrc`에 등록해주고 반드시 리로드해준다.
* 현재로선 한글을 위해 baekmuk폰트를 설치했으나 한글입출력에 문제 발생
* 아래 한글문제 해결 참조

```console
sudo apt-get install cabextract #winetricks required
echo "export WINEARCH=win64" >> ~/.bashrc
echo "export WINEPREFIX=/home/borisu/.sketchup2017" >> ~/.bashrc
. ~/.bashrc
#first run: mono,gecko install? -> yes
#dotnet46: reboot? -> later click
winetricks corefonts && \ 
winetricks tahoma && \
winetricks baekmuk && \
winetricks riched30 && \
winetricks richtx32 && \
winetricks vcrun2015 && \
winetricks dotnet46 
```

## Install Sketchup

* `winetricks > winecfg > Graphics > r192dpi` 설정
* `winetricks > Explorer > sketchup2017make.exe` 실행

```console
winetricks 
```
또는 CLI 에서 winetricks로 직접 실행 가능
```console
winetricks path_to_your_sketchup_installer/sketchup2017make.exe
```

## 한글문제 해결

* winetricks 설치시 baekmuk폰트를 설치하였으나 작동하지 않음
* gulim.ttc를 수동 설치 후 해결
* sketchup에서 웹기반의 extension 툴들에서 한글이 깨짐. 아직 미해결
* 폰트 다운로드 사이트
<https://ko.cooltext.com/Download-Font-%EA%B5%B4%EB%A6%BC+Gulim>
* gulim.ttc를 다운로드 또는 윈도우에서 폰트를 복사하여 다음과 같이 설치
* <https://github.com/neosolaris/sketchup/raw/main/docs/gulim.ttc>

```console
cp gulim.ttc ${WINEPREFIX}/drive_c/windows/Fonts/
```

## Setup Sketchup2017

* 기본 사용자폴더는 ${WINEPREFIX}/drive_c/users/사용자명/Documents
* 이 폴더는 리눅스에서 ${HOME}/Documents와 연결되어 있다.
* 최소한 ${WINEPREFIX}/drive_c 이하에 작업파일을 저장하는 것이 좋다.
* 문제는 ${WINEPREFIX}가 아닌 위치에서는 sketchup 자동저장 에러가 난다.
* 해결방법은 ${HOME}/Doucuments 이하에 작업파일을 저장하는 것이다.
* 백업시에는 이곳을 백업해주는 것이 현재로서는 제일 좋은 방법이다.

* 시작화면 없애기
	* ${WINEPREFIX}/drive_c/Program Files/SketchUp/Sketchup 2017/sketchup.exe 실행파일을 먼저 백업해두고 원본파일을 헥사에디터로 편집하고 저장한 다음 실행하면 된다. 아마도 스케치업이 실행될 때 시작화면이 뜨는 부분을 지워서 동작하지 않게 하는 것으로 보인다. 단 2017 make 버전에 한한다.
    * <http://www.edugeek.net/forums/educational-software/169465-disable-sketchup-2016-welcome-screen.html>
    * Open c:\program files\sketchup\sketchup 2017\sketchup.exe in a hex editor
    * Search for the following series of hex values: FF 90 F8 02 00 00 48 8B 83
    * Replace them with these hex values: 90 90 90 90 90 90 48 8B 83
    * Save and run the edited file, and the dialog box should no longer show

* 자주쓰는 Extension 설치 (3DWareHouse, SkechUcation)
	* FullScreen, OpenCutlist, Ruby Console+, Solid Inspector2
    * FullScreen의 경우 F11기능이 없으므로 Prefrence/Shortcut에 추가해주고 사용하면 편리하다.

* Preference Import
	* 자신이 주로사용하는 shortcut, 기타 설정 등을 import한다.

## Reference

* Install Sketchup Make on Ubuntu: <https://linuxhint.com/install-sketchup-make-on-ubuntu/>
* Sketchup Make 2017 Linux: <https://www.dedoimedo.com/computers/sketchup-make-2017-linux.html>
* How to Install Sketchup 2017 Make: <http://penguinfollies.blogspot.com/2021/01/how-to-install-sketchup-2017-make-in.html>
* sketchup2017 make download: <https://download.cnet.com/SketchUp-Make-2017/3000-6677_4-10257337.html>
