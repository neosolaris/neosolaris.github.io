---
title: Docker Example - 사용례
date: 2022-11-13T16:46:03+09:00
lastmod:
tags: ['docker','dockerhub','example','devel']
categories: ['tools']
---

## INTRO
* Requirement: Docker Hub registration
* Requirement: Docker install on local
* login and create and push images to docker hub

## Docker Login
```console
$ docker login
Username: neosolaris
Password: xxxxxxx
Login Succeeded
```

## Create Sample image

* create project dir and files
```console
$ mkdir myproject && cd myproject
$ vim server.js
$ vim Dockerfile
```

* server.js
```js
var http = require('http');

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  response.end('Hello World!');
};
var www = http.createServer(handleRequest);
www.listen(8080);
```

* Dockerfile
```
FROM node:6.9.2
EXPOSE 8080
COPY server.js .
CMD node server.js
```

## 이미지 빌드
* 명령 실행 후 브라우저에서 <http://localhost:8080> 확인
```console
$ docker build -t neosolaris/hello-nodejs:v1 .  #사용자명/저장소명:태그명
$ docker images  # 빌드이미지 확인
$ docker run -d -p 8080:8080 -t neosolaris/hello-nodejs:v1  # 테스트
```
* 컨테이너 종료
```console
$ docker ps  # 현재 컨테이너들 확인
$ docker stop <Container ID>  # 해당 컨테이너 종료
```

## 이미지 업로드
```console
$ docker push neosolaris/hello-nodejs:v1  #사용자명/저장소명:태그명
```
* Image 업로드는 도커허브에서 확인: <https://hub.docker.com/u/neosolaris>

## Links
* <https://snowdeer.github.io/docker/2018/02/14/docker-push-image-to-docker-hub/>
