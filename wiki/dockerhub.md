---
title: DockerHub - 도커허브 소개 및 활용
date: 2022-11-13T16:01:19+09:00
lastmod:
tags: ['docker','dockerhub','programming']
categories: ['tools']
---

## Intro

* 도커 이미지 원격 저장소
* 만들어 놓은 이미지를 업로드 및 다운로드 활용

## 회원가입

* <https://hub.docker.com> - 계정 및 이메일 등록 : 공개용(개인)은 무료
* hub.docker.com 접속 후 회원가입
* Email Confirm (자신의 이메일에서 인증)
* 도커허브 로그인

## 저장소 생성하고 로컬에서 빌드한 이미지 올리기

* 로그인 후 Repository 생성 
  - ex) 사용자명/저장소명:태그명 neosolaris/mdev:debian-luajit
* doocker client(my local pc)에서 다음과 같이 올린다.

```console
$ docker login  # hub에 회원가입한 id, password 등록
$ docker images # 내 이미지 확인 (mdev:debian-luajit이라 가정)
$ docker tag mdev:debian-luajit  neosolaris/mdev:debian-luajit
$ docker push neosolaris/mdev:debian-luajit  #사용자명/저장소명:태그명
```
* hub.docker.com 접속 후 repository 확인
* 위 과정 중 도커허브에서 저장소를 직접 만들지 않아도 local에서 로그인되어 있다면 `docker push`로 가능하다.

## 이미지 다운로드

* 도커허브에서 자신이 원하는 이미지 또는 자신이 만든 이미지를 다운받는다.
```console
$ docker pull gcc:bullseye   # 공식 debian-bullseye-gcc 환경 이미지
$ docker neosolaris/mdev:debian-luajit  # 내 프로젝트 이미지
```

## Links
* <https://hub.docker.com>
