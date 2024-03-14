---
title: Ubuntu install
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-23T18:55:21+09:00 
tags: ["linux", "ubuntu"]
categories: ["linux"]
---

* 설치 버전: 22.04 LTS
* 설치일: 2022.07.25

## 설치 준비

* 기존 [윈도우11](windows11) 에서 우분투를 위한 파티션 나누기
* [우분투](우분투) 설치 USB 만들기
* 윈도우11의 디스크 보안 키값을 복사: [리눅스](linux) 설치 후 윈도우11 부팅>    시에 문제가 된다.

## 설치하기

* 준비해 둔 USB로 부팅
* 설치 (미리 나누어 둔 파티션에 설치)
* 설치 완료

## 설치 후 설정

* 한글환경 설정: 한글폰트, 시스템언어설정, 한글입력기
* 우분투 윈도우 환경 설정

## 패키지 설치

* devel tools: build essential, [rust](rust), python3(기본설치)
* utils: rsync, curl, wget, [vim](vim), [nvim](nvim), fd-find, batcat ...
* [blender](blender): 최신패키지로 설치(PPA)
* [firefox](firefox): 최신패키지로 재설치(PPA) + plugins
* [freecad](freecad): 최신패키지로 설치(default apt)
* [sketchup](sketchup): winehq(PPA) + sketchup2017make + plugins
* vim, nvim plugins 설치 및 설정
