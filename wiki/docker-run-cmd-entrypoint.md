---
title: Dockerfile - run, cmd, entrypoint 차이
date: 2023-09-27T16:25:49+09:00
lastmod: 2023-10-13T17:43:29+09:00
tags: ['docker','run','cmd','entrypoint']
categories: ['devel']
---

## Dockerfile 에서 RUN, CMD, ENTRYPOINT  차이
* RUN - 도커이미지 생성시 동작
* CMD - 도커이미지 실행시 동작 (대체 가능)
* ENTRYPOINT - CMD와 같으나 실행시 반드시 동작

## Dockerfile - RUN
```
# create log script
vi log-event.sh
...
#!/bin/sh
echo `date` $@ >> log.txt
cat log.txt
...
chmod u+x log-event.sh

# create Docker Image
vi Dockerfile
...
FROM alpine
ADD log-event.sh /
RUN ["/log-event.sh","image created"] # 생성시 동작
CMD ["/log-event.sh","container started"] # 실행시 동작
...
docker build -t myimage .

# Run Docker Image - RUN은 이미지 생성시에 동작했음을 알 수 있다.
docker run myimage
Wed Sep 27 07:10:26 UTC 2023 image created
Wed Sep 27 07:36:10 UTC 2023 container started

docker run myimage
Wed Sep 27 07:10:26 UTC 2023 image created
Wed Sep 27 07:36:21 UTC 2023 container started
```

## Dockerfile - CMD, ENTRYPOINT

* 여러개의 CMD
```
# Create Docker Image
vi Dockerfile
...
FROM alpine
ADD log-event.sh /
RUN ["/log-event.sh","image created"] # 생성시 동작
CMD ["/log-event.sh","container started"] # 실행시 동작 (무시됨)
CMD ["/log-event.sh","container running"] # 실행시 동작 (마지막CMD처리)
...
docker build -t myimage .

# Run Docker Image
docker run myimage
Wed Sep 27 07:10:26 UTC 2023 image created
Wed Sep 27 07:23:09 UTC 2023 container running
```

* CMD와 ENTRYPOINT
```
# Create Docker Image
vi Dockerfile
...
FROM alpine
ADD log-event.sh /
RUN ["/log-event.sh","image created"] # 생성시 동작
ENTRYPOINT ["/log-event.sh"] # 실행시 동작
CMD ["container started"]    # 실행시 동작
...
docker build -t myimage .

# Run Docker Image
docker run myimage
Wed Sep 27 07:10:26 UTC 2023 image created
Wed Sep 27 07:23:09 UTC 2023 container started

# Run Docker Image with argument
docker run myimage custom event
Wed Sep 27 07:10:26 UTC 2023 image created
Wed Sep 27 07:24:31 UTC 2023 custom event
```

## REFERENCE
* Difference Between run, cmd and entrypoint in a Dockerfile - https://www.baeldung.com/ops/dockerfile-run-cmd-entrypoint
* Entrypoint vs cmd - https://bluese05.tistory.com/77
