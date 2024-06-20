---
title: Windows WSL2 Alpine Install
date: 2023-12-30T06:15:32+09:00
tags: ['wsl2','windows','alpine','install']
categories: ['alpine','linux']
---  

last updated: {{ "1718884488" | date: "%Y-%m-%d %H:%M" }}

## Intro

* minimum 수동 설치 방법이 있으나 데몬 서비스, docker 설치 등에 어려움이 있다.
* 여기에서는 다음 두 가지 설치 방법을 정리한다.
* 1. Microsoft Store - Alpine WSL Install, 2. Github - AlpineWSL Install
* 특이사항:
  - default shell: ash (필요하면 bash를 추가 설치: apk add bash bash-completion)
  - grep: busybox grep (고성능의 grep이 필요하다면 추가 설치: apk add grep)
  - sudo: doas (필요하면 추가 설치: apk add doas)
  - openssh: openssh (필요하면 설치: apk add openssh)
  - curl: wget은 기본 설치 (필요하면 추가설치: apk add curl)
  

## Microsoft Store  - Alpine WSL Install

* 참고 사항
    - 버전은 3.17로 2018년이다. 업데이트도 안되고 있는 듯.
    - 하지만 Microsoft Store를 이용하므로 편리하다.
    - application - `C:\Program Files\WindowsApps\36828agowa338.AlpineWSL_3.17.0.0_x64__my43bytk1c4nr\Alpine.exe`
    - ext4 filesystem - `C:\Users\batut\AppData\Local\Packages`

* Install
    - Microsoft Store > alpine 검색 > 설치 > 실행
    - 처음 실행시 user 및 password 입력: root는 설정해준 일반유저와 동일. ex) `$su -`

* 설치 후 PowerShell에서 Default로 설정

```console
wsl -s Alpine  # --set-default: wsl default set
```

* Alpine WSL2 실행후 기본 정보 확인

```console
$ passwd               # Password 설정
$ cat /etc/os-release  # Os Version Check
$ uname -a             # Os Info Check
$ df -Th /             # Disck Usage Check
```

* 기본 최소 패키지 설치

```console
$ su -        # Change to Root

# cat > /etc/apk/repositories << EOF; $(echo)
https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/main/
https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/
https://dl-cdn.alpinelinux.org/alpine/edge/testing/
EOF

# apk update  # Update
# apk add neofetch libstdc++ curl grep bash bash-completion openssh nvim  # libs, Utils
# apk add openrc git docker  # Daemon Service, Git, Docker Install
```

* doas (like sudo) 설정

```console
# vi /etc/doas.d/doas.conf
...
# user01 is username, root permition allowed, password once and cached
#permit persist user01 as root 
# user01 is username, root permition allowed, no password
permit nopass user01 as root  
...
```
## Github - AlpineWSL Install
* 최신 버전을 설치할 수 있다.
* 몇가지 설정만 하면 바로 사용 가능하다.

* 설치 준비
    - 최신 버전 다운로드: <https://github.com/yuk7/AlpineWSL/releases>
    - 적당한 폴더에 압축을 푼다. `ex) C:\WSL\Alpine\`
    - PowerShell 실행하여 해당 폴더로 이동
    - 해당 폴더에서 Alpine.exe를 실행하면 ex4.vhdx의 파일시스템이 생성된다.
    - 이 때, 이미 Alpine이 이미 설치되어 있다면 충돌을 피하기위해 Apline4184.exe 등으로 변경하고 실행한다.

* AlpineWSL 설치

```
c:\WSL\Alpine> mv Alpine.exe Alpine4184.exe
c:\WSL\Alpine> Alpine4184.exe
c:\WSL\Alpine> ls
c:\WSL\Alpine> wsl -l
c:\WSL\Alpine> wsl -s Alpine4184  # wsl default image set
c:\WSL\Alpine> wsl                # execute alpine linux
```

* alpine setup root, user

```
# cat /etc/os-release  # check os version
# apk update && apk upgrade  # package update, upgrade

# passwd root          # root password set
# addgrp -g 1000 borisu  # user set
# adduser -u 1000 -g 1000 -s /bin/bash -h /home/borisu borisu
# passwd borisu  # user password set

# apk add doas
# vi /etc/doas.d/doas.conf
# exit
```

* config alpine default login user
	- `C:\> wsl -d Alpine4184 -u borisu`로 직접 실행 가능.
	- 아래는 직접 설정을 해주고 `wsl -d Alpine318`을 실행 하는 방법이다.

```
PS C:\wsl\Alpine> .\Alpine318.exe config --default-uid 1000
PS C:\wsl\Alpine> .\Alpine318.exe config --default-user borisu
```

* Windows Terminal Setting
    - 윈도우즈 터미널의 설정을 클릭한다.
    - 좌측 메뉴 새프로파일 추가
    - 이름: `Alpine4184`
    - 명령줄: `C:\WINDOWS\system32\wsl.exe -d Alpine318`
    - 기타 설정 후 저장

## 이후 작업
* 필요한 패키지 설치
* Alpine의 도커 설치는 [docker-windows](docker-windows) 참조.

## REFERENCE

* Automated Alpine Linux Setup in WSL2   
<https://www.numbersandreality.com/computers/linux/alpine-wsl/>

* Alpine Docker Install   
<https://wiki.alpinelinux.org/wiki/Docker>

* Install Alpine Linux on WSL and connect it to Docker Desktop
<https://gist.github.com/mac641/07a53ba45f0b30af046d6f9ed94a1ace>
 
* How to enable services on Alpine Linux   
<https://www.cyberciti.biz/faq/how-to-enable-and-start-services-on-alpine-linux/>

* Openrc Howto on Alpine   
<https://wiki.alpinelinux.org/wiki/OpenRC>
