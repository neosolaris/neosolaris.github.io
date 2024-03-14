---
title: Fits-Liberator
date: 2022-10-11T23:13:33+09:00
lastmod:
tags: ['fits','liberator','astro']
categories: ['graphic', 'astronomy']
---

## Intro
* 천문사진 주로 FITS 전처리 프로그램
* version 4 부터 리눅스를 지원한다.
* 입문자가 쉽게 사용할 수 있도록 만들었다.
* GUI 뿐만 아니라 자동화를 위한 CLI가 제공된다.
* 내부 사용 라이브러리는 [fitsio](fitsio)가 사용된다.
* Judy Schmidt도 전처리 프로그램으로 이것을 쓴다.

## Install
* [홈페이지](https://noirlab.edu/public/products/fitsliberator)에서 다운로드 및 설치 가능하다.

* Ubuntu, Debian
```console
$ sudo apt install libvips  #cfitsio도 필요하나 의존성으로 깔린다.
$ sudo dpkg -i fitsliberator_4.x.x_amd64.deb
$ export PATH=$PATH:/opt/FITS\ Liberator/fitscli/linux/
```

## Usage

다음을 우선적으로 공부하고 나머지는 홈페이지를 방문하자.

* Quick Start Guide v4
  - <https://noirlab.edu/public/media/archives/techdocs/pdf/techdoc024.pdf>

## Links
* Home <https://noirlab.edu/public/products/fitsliberator/>
* FITS Liberator CLI <https://gitlab.com/noirlab/fits-liberator-cli>
* FITS Liberator GUI <https://gitlab.com/noirlab/fits-liberator-gui>
