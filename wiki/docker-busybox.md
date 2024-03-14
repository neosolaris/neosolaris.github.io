---
title: Docker-Busybox
date: 2022-11-21T14:53:47+09:00
lastmod: 2024-02-15T15:15:47+09:00
tags: ['docker','busybox','linux']
categories: ['linux']
---

## Intro
* [busybox](busybox)는 작고 가볍고 빠른 POSIX 표준 유틸 모음이다.
* docker에서 여러 가지로 응용해서 사용할 수 있다.

## 응용
* 임베디드 시스템에 빌드하기
* Kubernates에 init container로 사용하기
* HTTP 웹서버로 돌리기
* 가상컨테이너 볼륨서버(스토리지)로 사용하기

## 기본 사용례
* busybox 최신버전 이미지 받고 실행
```console
$ docker run -it --rm busybox
```

* busybox + myapp : myapp은 리눅스환경에서 정적컴파일한 바이너리
```console
$ cat Dockerfile  # Write Dockerfile
FROM busybox
COPY ./my-static-binary /my-static-binary
CMD ["/my-static-binary"]

$ docker build -t busybox-myapp .  # Build Image
$ docker run -t --rm busybox-myapp  # Run Container
```

* busybox + httpserver : 웹서버동작(httpserver는 static compile binary)
```console
$ cat Dockerfile  # Write Dockerfile
FROM busybox
COPY ./httpserver /home/
CMD /home/httpserver

$ docker build -t go-server .  # Build Image
$ docker run -p 8080:8080 --rm -it go-server # Run Container

$ curl -v http://localhost:8080/  # Test
```

## Busybox에 관하여
* 놀랍게도 busybox는 httpd를 내장하고 있다. 물론 대규모 처리는 곤란하다.
* 내장된 grep도 기본 기능만 있다. 대용량 파일 검색을 써야한다면 효율이 좋지 않으므로 gnu grep을 얹어서 사용하는 것이 좋다.
* busybox는 glibc, musl 등을 지원하는 버전이 있다.
* 이를 활용하면 여러개의 프로그램을 넣어야할 때 공유라이브러리를 활용할 수 있어 효율적이다.
* alpine 리눅스가 busybox + musl + os env 이므로 자신만의 이미지를 제작하는 것도 가능하다.
* 기본적인 utf-8이 지원되지만 출력만 문제가 없는 것으로 보인다.
* sh, echo, vi 도 가볍게 쓰기는 좋으나 utf-8 한글입력이 안된다.
* 이를 보완하기 위해서는 bash, echo, vi를 정적컴파일 바이너리로 대체
* 또는 도커허브(DockerHub)의 toybox를 사용하는 것이다. utf-8 입출력을 모두 지원한다. 심지어 사이즈가 더 작다.
* utf-8의 입출력 환경이 모두 필요하다면 toybox를 사용하는 것이 더 낫다.
* busybox(약1.2MB)나 toybox(약764K)는 정말 가볍게 실행하고 배포할 수 있는 환경이다.
* 결론적으로 이것에 대한 활용은 개발환경이나 큰규모의 실행환경보다는 작고 가벼운 환경에서 효율적인 운용이 필요할 때 사용하면 좋을 것 같다.

## Links
* How to Use th Busybox Docker Official Image
  - <https://www.docker.com/blog/use-cases-and-tips-for-using-the-busybox-docker-official-image/>
* Using the BusyBox Docker Image for Building Applications : A Complete Guide
  - <https://www.sohamkamani.com/docker/busybox-guide/>
