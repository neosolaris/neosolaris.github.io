---
title: Docker - 소프트웨어 개발 플랫폼
date: 2022-11-09T22:32:02+09:00
lastmod: 2023-08-03T17:00:25+09:00
tags: ['docker','devel','container']
categories: ['tools']
---

## Intro

* docker는 응용프로그램 개발을 위한 소프트웨어 플랫폼이다. 
* Linux 기반에서 독립된 컨테이너(하나의 프로세스) 형태로 동작한다.
* go 언어로 개발되었다.
* 가상OS와는 다르게 가볍고 빠르다.
* 빌드된 이미지를 언제 어디에서는 docker를 통해 문제 없이 실행할 수 있다.
* 자신만의 개발환경을 이미지로 구축해 놓으면 개발 컴퓨터가 달라져도 동일한 환경에서 개발할 수 있다.
* 실행환경을 이미지로 만들어 놓으면 사용자가 동일한 환경에서 문제없이 실행할 수 있다.
  
## Docker 설치 및 기본 사용법
* [docker install](docker-install) - Docker 설치
* [docker setup](docker-setup) - Docker 설정
* [docker build](docker-build) - Dockerfile 작성
* [dockerhub](dockerhub) - Docker Hub와 회원 가입
* [docker example](docker-example) - Docker Example: 사용례

## Docker Tips
* [docker run cmd entrypoint](docker-run-cmd-entrypoint) - Docker run, cmd, entrypoint 차이
* [docker images remove](docker-images-remove) - Docker Image 제거

## Docker 응용
* [docker busybox](docker-busybox) - 도커 busybox 활용
* [docker windows](docker-windows) - 윈도우즈에서 도커 설치 및 사용

## Links
* <https://hub.docker.com/>
* <https://www.sobyte.net/post/2022-04/docker-copy/>
* <https://docs.docker.com/engine/reference/builder/>
