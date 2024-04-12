---
title: Docker on Windows - 윈도우즈에서 도커 설치 및 사용
date: 2023-08-03T17:04:47+09:00
lastmod: 2023-08-08T15:47:34+09:00
tags: ['docker','windows','alpine','wsl']
categories: ['docker']
---

last updated: {{ "1712974295" | date: "%Y-%m-%d %H:%M" }}

## 개요

- 윈도우즈에서 도커를 사용하는 방법을 설명한다.
- 이것으로써 윈도우, 리눅스의 모든 환경에서 도커의 범용성과 안정성이 확보된다.
- 즉, 개발환경, 테스트환경, 실행환경의 일관성을 갖게 된다.
- 첫째는 `WSL2 + Git Bash + Docker Desktop`를 결합하여 사용하는 방법이다.
- 둘째는 `WSL2 + Alpine`를 설치하고 알파인 리눅스에서 `git + docker`의 형태로 사용하는 방법이다.
- 두번째 방법이 조금 복잡해 보이긴 하나 훨씬 처리가 간결하고 적은 리소스와 빠른 실행 속도가 돋보인다.
- 또한 리눅스 기반이므로 파일시스템 문제, 퍼미션 문제, 경로 처리 문제 등에서 훨씬 쉽고 편한 환경이므로 두번째 방법에 대해서 상술한다.

## Windows WSL2 공통 기반 설정

* 설치환경: Windows 11
* Bios 설정: 바이오스에서 가상머신 지원(Virtual Machine Support) 여부를 선택한다. 
* WSL2를 확인하고 필요하면 업데이트한다. (PowerShell:관리자권한으로)
```console
> wsl -l -v    # Version Check
> wsl --update # wsl2 upgrade or update
```

## Nerd Font 설치

* 터미널에서 아이콘 등 nerd font가 표시되고 코딩시 가독성을 높이기 위해서 설치
* MeslsLGS NF Install
https://github.com/fontmgr/MesloLGSNF
* D2Coding (코딩용 영문 한글 지원: 하지만 이것은 Nerd Font가 아니다.)
https://github.com/naver/d2codingfon

## WSL2 + Git Bash + Docker Desktop

* Docker Desktop
  - 기본 설치: 설치 후 계정이 없으면 가입하고 로그인한다. 준비 완료
  
* Git Bash
  - 기본 설치: 단, 아래 설정으로 CRLF 처리를 자동 변환하지 못하도록 한다.(깃허브 다운 및 도커 사용시 문제 발생)
  - Configuring the line ending conversions -> Checkout <as-is, commit as-is>

* 실행하기
  - Docker Desktop 실행
  - Git Bash 실행
  
```console
$ docker --version        # version check
$ docker run hello-world  # run test
$ docker ps -a            # process check 
```
* 사용시 주의 사항
  - Git Bash 실행 터미널 설정: 자신에게 맞게, 위의 Nerd Font 설정
  - 경로 설정시 에러 및 해결 방법
  
```console
$ docker run --rm -it -v $(pwd):/data docker_image_name  # Path Name Error
$ docker run --rm -it -v /$(pwd):/data docker_image_name  # Fixed, //c/User/user_name...
$ MSYS_NO_PATHCONV=1 docker run --rm -it -v $(pwd):/data docker_image_name  # Set Msys Env First
```
  
## WSL2 + Alpine + Git + Docker

- minimum 수동 설치 방법이 있으나 데몬 서비스, docker 설치 등에 어려움이 있다.
- 윈도우즈 앱 > alpine 검색 > 설치 > 실행
- 처음 실행시 user 및 password 입력: root는 설정해준 일반유저와 동일. ex) `$su -`
- 특이사항:
  - default shell: ash (필요하면 bash를 추가 설치: apk add bash bash-completion)
  - grep: busybox grep (고성능의 grep이 필요하다면 추가 설치: apk add grep)
  - sudo: doas (필요하면 추가 설치: apk add doas)
  - openssh: openssh (필요하면 설치: apk add openssh)
  - curl: wget은 기본 설치 (필요하면 추가설치: apk add curl)
  
### Alpine Init & Setup

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

# user01 is username, root permition allowed, password once and cached
#permit persist user01 as root 
# user01 is username, root permition allowed, no password
permit nopass user01 as root  
...
```

### Docker Setup

* 다음 수행 후 alpine 종료 및 재실행
* alpine에서 docker는 community repository에 있다. 추가한다.
* 서비스에 등록하고 실행하기 위해 openrc를 설치하고 설정해 준다.
* 서비스 등록은 한 번만 해주면 된다.

```console
# rc-update add docker default  # add service docker 
# rc-update                     # check docker is added the default run level
# usermod -aG docker borisu     # Add group user borisu to docker
# exit
```
  
### Alpine Docker Test

* 아래 `openrc default` 명령은 윈도우즈 부팅 후 한 번만 수행해 준다. (docker 서비스 실행)
* 이후 사용 중 여러개의 터미널을 띄울 수 있다.

```console
$ doas openrc default           # service running default with docker
$ doas rc-status
$ docker --version              # docker version check
$ docker run hello-world        # run test
$ docker ps -a                  # docker container process check 
$ exit                          # exit
```

### Git Setup

* ssh-keygen으로 키를 만든다.
* 자신의 깃허브 계정 홈에  `~/.ssh/id_ed25519.pub` 내용을 등록해준다.

```console
$ ssh-keygen -t ed25519 -C "yourmail@mail.com"     # KEY GENERATE
$ cat ~/.ssh/id_ed25519.pub                        # COPY PUB KEY, ADD to GITHUB

$ git config --global user.name <user_name>        # User name set
$ git config --global user.email <user_email>      # User email set
$ git clone git@github.com:user_name/user_project  # Clone my project form GITHUB
$ ls user_project
```

## Alpine WSL2 사용 팁

* Alpine-WSL2 버전 업그레이드 후 network 문제 발생시

```console
$ su -
# touch /etc/network/interfaces
# openrc default
```

* 실행아이콘(터미널실행)
  - 일반적으로는 실행 아이콘을 누르면 탭이 지원되는 파워쉘 환경에서 동작한다.
  - 터미널의 설정에서 이미 설치한 Nerd Font 및 기타 설정을 한다.

* PowerShell에서 실행

```console
c:\> wsl -d Alpine [-u username]  # 실행
c:\> wsl -t Alpine                # 종료(terminate)
```

* Visual Studio Code with WSL2
  - vim이 아닌 vscode 사용자는 플러그인을 사용하여 연동할 수 있다.
  - 플러그인 remote-wsl을 설치
  - 이를 통애 wsl과 연동 및 terminal 사용가능
  - 콘솔 또는 터미널에 자동으로 code 명령이 잡힌다. `$ cd ~/my_project; code .`
    이렇게 사용이 가능하다.

## REFERENCE

* Automated Alpine Linux Setup in WSL2   
https://www.numbersandreality.com/computers/linux/alpine-wsl/

* Enable Community Repository   
https://wiki.alpinelinux.org/w/index.php?title=Enable_Community_Repository&redirect=no

* Remoting SSH support for Alpine Linux   
https://github.com/microsoft/vscode-remote-release/issues/6347

* Alpine Docker Install   
https://wiki.alpinelinux.org/wiki/Docker

* How to enable services on Alpine Linux   
https://www.cyberciti.biz/faq/how-to-enable-and-start-services-on-alpine-linux/

* Openrc Howto on Alpine   
https://wiki.alpinelinux.org/wiki/OpenRC
