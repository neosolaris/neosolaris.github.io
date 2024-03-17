---
title: Redis - Remote Dictionary Server
date: 2024-01-01T02:08:34+09:00
tags: ['redis','dbms']
categories: ['db']
---
last updated: {{ "1710725585" | date: "%Y-%m-%d %H:%M" }}

## INTRO

레디스(Redis)는 Remote Dictionary Server의 약자로서[4], "키-값" 구조의 비정형 데이터를 저장하고 관리하기 위한 오픈 소스 기반의 비관계형 데이터베이스 관리 시스템(DBMS)이다. 2009년 살바토르 산필리포(Salvatore Sanfilippo)가 처음 개발했다. 2015년부터 Redis Labs가 지원하고 있다. 모든 데이터를 메모리로 불러와서 처리하는 메모리 기반 DBMS이다. BSD 라이선스를 따른다. DB-Engines.com의 월간 랭킹에 따르면, 레디스는 가장 인기 있는 키-값 저장소이다.

## INSTALL - alpine linux

```console
# Install Redis
doas apk add redis redis-openrc

# Add Openrc 
doas rc-update add redis default

# Run redis server
doas openrc default
rc-status

# Connect to redis
redis-cli
```

## Links

* Redis - <https://redis.io>
* Install - <https://redis.io/docs/install>
* Docs - <https://redis.io/docs>
* command ref - <https://redis.io/commands/>
* redis lua - <https://www.freecodecamp.org/news/a-quick-guide-to-redis-lua-scripting/>
