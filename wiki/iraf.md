---
title: IRAF - Image Reduction and Analysis Facility
date: 2022-10-12T16:02:55+09:00
lastmod: 2022-10-30T00:05:48+09:00
tags: ['iraf','fits','image','astro']
categories: ['graphic','astronomy']
---

## Intro
* [FITS](fits) 데이터 분석 및 이미지 처리 도구 집합
* NOAO(National Optical astronomy Observatory)에서 개발
* 현재 오픈소스로 공개하여 [iraf community](https://iraf-community.github.io) 가 관리하고 있다.
* 주로 관측천문학 분야에서 활용되고 있다.
* 파이썬으로 랩핑한 [pyraf](pyraf)가 있다.
* 컴파일과 패키지 설치 두 가지가 있다. (패키지 설치 권장)
* 현재 많은 소프트웨어들이 나와있으나 타언어로 랩핑하였거나 인터페이스만 바꾸어 라이브러리를 그대로 사용하고 있다.
* 일종의 고전이라고 볼 수 있겠다.

## Install Packages 
* Ubuntu18.x 이후부터 패키지 제공
```console
$ sudo apt install xterm xgterm # terminal for iraf 
$ sudo apt install saods9       # ds9 FITS Viewer for iraf
$ sudo apt install iraf iraf-dev iraf-noao iraf-noao-dev iraf-wcstools iraf-rvsao
```

## Install From Source
* [Download Source](https://github.com/iraf-community/iraf/archive/refs/tags/v2.17.tar.gz)

* Install Packages for compile IRAF
```console
$ sudo apt install gcc make flex
$ sudo apt install libcurl4-openssl-dev libexpat-dev libreadline-dev
$ sudo apt install xgterm xterm  # 둘 중 하나 선택해서 설치
$ sudo apt install ds9           # FITS View and Edit Tool (Tcl/Tk기반)
```
 `xgterm -fg ivory -bg black -font 9*15bold &` 이런식으로 사용

* Initial Setup
```console
$ tar xvfz iraf-2.17.tar.gz
$ cd iraf-2.17
$ ./install
-> iraf의 설치 경로를 정해준다. default: ~/.iraf/
-> xgterm을 디폴트로 설정
```
* Compile : 컴파일까지 내 놋북에서 약 7분 정도 소요
```console
$ . ~/.bashrc   # 쉘환경 재설정 (setup for iraf)
$ make linux64
$ make sysgen 2>&1 | tee build.log
$ ./test/run_tests  # 테스트
```

* After Install
```console
$ cd /data/IRAF/M50   # goto fits data folder
$ mkiraf              # 초기파일 생성
cl> help              # 도움말
cl> logout            # 나가기
```

* 문제는 cl 사용이 조금 불편하다는 것이다.
* readline이 적용되지 않는 것 같다. 
* github community 에서 릴리즈 등을 확인해 보자

## 터미널 실행
* 패키지 설치의 경우 `mkiraf` 명령을 사용하지 않아도 된다.

* 실행하기
```console
$ irafcl -x   # 현재 터미널에서 실행
$ xterm -fn 10*20 -e irafcl &         # xterm 또는 xgterm에서 실행
$ xterm -fn 10*20 -e irafcl & ds9 &   # ds9와 함께 사용
```

* 폰트가 너무 작고 사용이 불편하다. 다음과 같이 조정해서 alias로 사용
```console
$ vim ~/.bashrc
...
alias irafcl='xterm -bg black -fg gray -fa "Monospace" -fs 10 -geometry 80x50 -e irafcl & ds9 &'
:wq
$ . ~/.bashrc
$ irafcl
```

## 기본 사용법
```console
$ irafcl
el> help    # 메뉴 도움말
       dataio - Data format conversion package (RFITS, etc.)
       images - General image processing package
     language - The command language itself
        lists - List processing package
        local - The template local package
     obsolete - Obsolete tasks
         noao - The NOAO optical astronomy packages
         plot - Plot package
        proto - Prototype or interim tasks
     softools - Software tools package
       system - System utilities package
    utilities - Miscellaneous utilities package
el> logout  # 나가기
```

## HOWTO
* 이제 해야할 것은 [FITS](fits) 파일 포맷과 이를 분석하는 것이다.
* 샘플이 있어야하고 이를 토대로 한걸음씩 나아가야한다.
* 아래 링크의 문서를 순서대로 참고하면 되겠다.
* 좀 오래된 것들도 있으니 감안해서 참고한다.

1. [IRAF를 이용한 측광 자료 전처리 - 서울대 천문학부](https://astro.kias.re.kr/~hshwang/NEW_IRAF_ABC.pdf)
2. [A Beginner's Guide to Using IRAF - IRAF](https://iraf-community.github.io/doc/beguide.pdf)
3. [Other Documents](https://iraf-community.github.io)

## Links
* https://yumingfu.space/tech/iraf-installation/
* https://www.bilibili.com/read/cv16854077
* https://maravelias.info/2011/03/installing-iraf-in-ubuntu/
* 여기 깃허브에 우분투20.04 설치스크립트가 있다.
* https://gist.github.com/JacobHilbert

