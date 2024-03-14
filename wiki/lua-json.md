---
title: JSON - Lua Module
date: 2022-11-07T22:28:56+09:00
lastmod:
tags: ['json','lua','module']
categories: ['programming']
---

## Intro

* 결론은 lua cjson이 가장 빠르다. 그 다음이 lunajson
* dkjson은 순수 lua파일이고 단일 파일이다.
* 또 다른 하나는 json.lua 이다. 빠르다고 하는데... 비교적 최신이다.
* cjson은 빠르나 모듈 컴파일이 필요하고
* lunajson은 다음으로 빠르고 순수 lua파일이지만 여러 개의 파일로 분리되어 있다.
* dkjson은 셋 중 가장 퍼포먼스가 낮으나 단일 파일이다.
* 상황에 따라 적절히 사용하다.

## Links

* <https://github.com/grafi-tt/lunajson>
* <http://dkolf.de/src/dkjson-lua.fsl/home>
* <https://github.com/rxi/json.lua>
* <https://somedudesays.com/2019/12/using-json-with-lua>

