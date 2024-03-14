---
title: Gimp - Install
date: 2023-01-11T14:59:32+09:00
lastmod:
tags: ['gimp','install']
categories: ['graphic']
---

## Intro
* 그림파일 및 사진 편집 프로그램.
* 무료지만 전문가도 사용하는 훌륭한 그래픽 편집 툴.
* 다양한 플러그인 지원
* RAW 무손실 사진 편집 지원

## Install 
우분투 22.04를 기준으로 설명한다. 한글 입력 문제 등으로 snap 설치는 권장하지 않는다. Flatpak 방식이 더 좋겠으나 역시 한글을 사용하려면 문제가 된다.

* 기본 패키지 설치
```console
$ sudo apt install gimp
```

* PPA 최신 패키지 설치
```console
$ sudo add-apt-repository ppa:savoury1/gimp -y
$ sudo apt-get update
$ sudo apt install gimp -y
```

## 플러그인 설치

## Links
* gimp install in ubuntu <https://www.linuxcapable.com/how-to-install-gimp-on-ubuntu-22-04-lts/>

