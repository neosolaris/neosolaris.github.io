---
title: SimpleITK - Open Source Multi-dimensional Image Analysis
date: 2022-09-29T17:51:54+09:00
lastmod:
tags: ['simpleitk','image','processing']
categories: ['graphic']
---

## Intro
* simpleitk는 오픈소스로서 주로 의료, 천문에서 사진을 프로세싱하는 툴킷이다.
* 주로 python을 사용하는데 설치와 사용이 너무 지저분하고 번거롭다.
* [lua](lua)를 사용하는 방법을 알아 보았다.
* 설치는 [luarocks](luarocks) 패키지 매니저를 사용하였고 api형태로 컴파일해서
  사용한다.

## Install

* Python Package Install
```console
$ pip install SimpleITK
$ pip install SimpleITK-SimpleElastix
$ vim test.py
```
```python
import SimpleITK as sitk
```

* Lua Package Install : version 2.2.0
```console
$ luarocks search simpleitk           # 패키지 검색
$ luarocks install --local simpleitk  # 로컬`~/.luarocks`에 설치
$ vim test.lua
```

```lua

```

## Links
* Quick Start: <https://simpleitk.readthedocs.io/en/master/gettingStarted.html>
* Github Page: <https://github.com/SimpleITK/SimpleITKLuaRock>
* Python SimpleITK Howto: <https://bo-10000.tistory.com/61>
