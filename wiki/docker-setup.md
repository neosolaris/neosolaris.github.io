---
title: Docker Setup - 설정
date: 2022-11-09T22:57:27+09:00
lastmod:
tags: ['docker','setup']
categories: ['tools']
---

## Docker 데몬 서비스 설정
* 패키지를 설치할 경우 자동으로 등록되지만 실패할 경우 다음과 같다.
```console
$ sudo systemctl status docker  # 서비스 Active 확인실패
$ sudo systemctl enable docker  # 부팅시 서비스 자동 실행 설정
$ sudo systemctl start docker  # 서비스 실행
$ sudo systemctl restart docker  # 서비스 재실행
$ sudo systemctl status docker  # 서비스 동작확인
```

## Docker를 일반 사용자 권한으로 변경
* 항상 docker를 사용할 때 `sudo`를 사용하므로 번거롭다.
```console
$ sudo usermod -aG docker ${USER} # 이후 로그아웃하거나 재부팅
$ sudo reboot

$ groups  # 그룹에 docker가 있는 지 확인
$ docker ps -a  # sudo 없이 명령 실행
```

## Docker 로컬 디렉토리 변경
* `/var/lib/docker`가 기본 디렉토리이다.
* `/var`는 보통 root 파티션이므로 사용중 공간문제가 발생할 수 있다.
* `/data/docker`라는 충분한 공간으로 변경한다면 다음과 같다.
* 우분투나 데비안 기준이고 `docker 20.10.21` 버전의 예이다.
* 이 설정은 docker 설치 초기에 해야한다. (그렇지 않다면 백업 필수)

```console
$ sudo systemctl stop docker  # 서비스 중지
$ sudo systemctl status docker  # 서비스 상태 확인
$ sudo cat<<EOF > /etc/docker/daemon.json   
{
    "graph": "/data/docker"
}
EOF

$ sudo rm -rf /var/lib/docker  # 기존 디렉토리 제거
$ sudo systemctl start  # 서비스 실행
$ docker info | grep 'Docker Root Dir' # 디렉토리 변경 확인
 Docker Root Dir: /data/docker
$ ln -s /data/docker /var/lib/docker  # 호환을 위해 링크를 생성
```
