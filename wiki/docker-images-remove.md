---
title: Docker Images Remove - 도커 이미지 제거
date: 2022-11-21T15:46:59+09:00
lastmod:
tags: ['docker','remove','images']
categories: ['linux']
---

## 기본 사용법
```console
$ docker images  # 도커 이미지 리스트 확인
$ docker images -all  # 히든 이미지까지 모두 보기
$ docker rmi <ID>  # image ID로 제거
$ docker rmi -f <ID>  # image ID로 강제로 제거
```

## Docker none image 정리하기
  
```console
$ docker container prune  # 컨테이너 모두 종료
$ docker image prune   # <none> 이미지 모두 제거
  
$ docker system pruen  # 한 번에 처리
```
