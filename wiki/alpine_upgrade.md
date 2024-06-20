---
title: Alpine Linux Upgrade
date: 2024-06-20T03:06:58+09:00
tags: ['alpine','upgrade','linux']
categories: ['alpine']
---

## Intro

알파인 리눅스에서 패키지만 업그레이드 하거나 OS 자체를 업그레이드 하는 방법을 설명한다.

## 패키지 업그레이드

```
# apk update 
# apk upgrade
```

## OS 업그레이드

1. 기존 패키지 업그레이드

```
# apk update
# apk upgrade
```

1. 저장소 설정 파일 수정 (ex. 3.18 -> 3.19)

```
# vi /etc/apk/repositories
```

1. 인덱스 업데이트 및 os 업그레이드

```
# apk update
# apk upgrade --available && sync
# reboot
```

1. 릴리즈 정보 업그레이드

```
# rm /etc/alpine-release
# apk upgrade --no-self-upgrade --available --simulate
# apk upgrade --available
# sync
# reboot
...
# cat /etc/alpine-release
# cat /etc/issue
```

## REFERENCE

* How to upgrade Alpine Linux 3.19 to 3.20  
<https://www.cyberciti.biz/faq/how-to-upgrade-alpine-linux-3-4-to-3-5-xx/>
