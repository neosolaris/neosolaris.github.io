---
title: Docker Install
date: 2022-11-09T22:37:49+09:00
lastmod:
tags: ['docker','install']
categories: ['tools']
---

## Ubuntu 22.04 Install

* 기존 패키지로 설치 - 낮은 버전(1.5-2)
```console
$ sudo apt update
$ sudo apt install docker docker-engine docker.io containerd runc
```

* 저장소로 최신 버전 설치 (20.10.21) - `docker-ce`만 설치해도 된다.
```console
$ sudo apt update
$ sudo apt install ca-certificates curl gnupg lsb-release -y
$ sudo mkdir -p /etc/apt/keyrings
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
$ echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
$ sudo apt update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

## Script Install
```console
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ DRY_RUN=1 sudo sh ./get-docker.sh
```

## Test 
```console
$ sudo docker --version  # 버전 확인
$ sudo systemctl status docker  # 서비스 Active 확인
$ sudo docker run hello-world  # 테스트
$ sudo docker ps -a  # 프로세스 fhrm ghkrdls
```

## Uninstall
```console
$ sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
```

## Links
* <https://docs.docker.com/engine/reference/builder>
* <https://linuxhint.com/install-docker-ubuntu-22-04>
* <https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04>
