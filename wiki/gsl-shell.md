---
title: gsl-shell - Luajit GNU Scientific Library Shell
date: 2023-02-01T15:58:52+09:00
lastmod:
tags: ['gsl','lua','luajit','science']
categories: ['programming']
---

## Intro
* gsl-shell은 GSL(GNU Scientific Library에 luajit을 기반으로 만들어졌다.
* 매트릭스, 벡터 및 여러 함수 등을 쉽게 만들고 사용할 수 있다.
* 여러 함수에 대한 그래프를 출력을 지원한다.
* luajit + 추가 함수 및 명령어로 구성되어 있다.
* 비슷한 다른 도구 중에 매우 우수한 연산 능력과 속도를 자랑한다.

## Install
* 성능 최적화를 위해 직접 빌드하는 방법은 아래 깃허브 링크를 참조한다.
* 데비안, 우분투에서는 GSL외에 gsl-shell은 패키지가 없다.
* 처음 사용한다면 빌드된 바이너리를 설치하는 것이 좋다.
* 다운로드 릴리즈는 여러가지가 있으니 설명을 참고해서 적합한 것으로 내려받는다.

```console
$ sudo apt install libgsl27 libgslcblas0
$ wget https://github.com/franko/gsl-shell/releases/download/v2.3.4/gsl-shell-dynamic-linux-x86-64.tar.gz
$ tar xvfz gsl-shell-dynamic-linux-x86-64.tar.gz
$ ls gsl-shell
$ export PATH=$PATH:$HOME/gsl-shell/bin  # ~/.bashrc에 추가 등록
$ gsl-shell  # 실행
GSL Shell 2.3.4 -- Copyright (C) 2009-2022 Francesco Abbate
GNU Scientific Library -- Copyright (C) The GSL Team
LuaJIT 2.0.5 -- Copyright (C) 2005-2022 Mike Pall. https://luajit.org/
JIT: ON CMOV SSE2 SSE3 SSE4.1 AMD fold cse dce fwd dse narrow loop abc sink fuse
>    # 나가기(Ctrl+d)
$
```

## 기본 사용법
* 대화식이 아닌 소스를 작성해서 실행할 경우 아래 방법외에 `#!/usr/bin/env gsl-shell`을 첫 줄에 넣고 chmod로 실행권한을 주어 직접 실행해도 된다.
* 스크립트 확장자를 lua로 하는 것은 편집기 등에서 문법 강조등의 지원을 받기 위함도 있고 lua의 문법을 따르기 때문이기도 하다.
* 그러나 lua나 luajit에서는 정상 동작하지 않으므로 식별이 가능한 폴더를 만들고 정리해 두는 것이 좋다.

```console
$ gsl-shell --help
$ gsl-shell  # 대화식 사용
$ gsl-shell my-program.lua   # 스크립트 실행
```
* 이렇게 준비가 되었다면 아래 문서를 참고해서 공부하면 된다.
* 이것을 어떻게 쓰는가는 자신에게 달렸다. 
* GSL에 어느정도 아는 사용자라면 더욱 수월할 것이다.
* 참고로 설치된 GSL 라이브러리를 어떻게 사용하는지도 나와 있으니 참고한다.

## 기타 도움말
* 문서대로 `use "math"` 등을 사용하면 에러가 난다.
  - gsl-shell/share/gsl-shell/import.lua 을 수정한다.
  ```
  ...
  -- 아래 문장을 주석처리하고 그 아래 문장으로 고친다.
  -- local level = getinfo(2, "") and 2 or 0 
  local level = 2
  ```
* 대화형 모드 사용시에 `rlwrap`을 같이 사용하면 편리하다.
* 사용되는 모듈과 함수를 편집기에서 자동완성, 검색 등을 지원하는 것은 아직 모른다. 최소한 함수 이름을 추출해서 vim 등과 연동하거나 grep을 활용하는 방법으로 시작하기로 한다.

## 문서작성시 수학식 표현

* 관련 프로그램(스크립트)를 작성한 후 도움말이나 문서를 작성할 때 가장 좋은 방법은 마크다운(markdown) 문서에 latex 문법으로 작성하는 것이다.
* [사용방법](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions)을 참조한다.
* 즉, 문장 중에는 `$수식$` 으로 표현하고 독립적인 수식은 `$$수식$$`으로 표현하는 것이다.
* 깃허브나 기타 웹페이지에서 이를 잘 지원한다.
* `vscode`에서는 `markdown all in one` 플러그인을 설치하면 미리보기로 실시간으로 확인할 수 있다. 물론 수학표현식도 지원한다.
* `vim`에서는 `hugo`로 로컬에서 서버를 띄어 실시간 확인하는 방법을 사용하거나 `firefox`의 `markdown`지원 모듈인 [markdown viewer webtext](markdown-viewer-webtext)를 사용하면 실시간 확인이 가능하다.
* 이와 관련된 사항은 다른 문서로 정리해 볼 생각이다.

## Links
* GSL Shell project page <https://github.com/franko/gsl-shell/>
* GSL Documentation <https://franko.github.io/gsl-shell/>
* Download Release <https://github.com/franko/gsl-shell/releases/tag/v2.3.4>
