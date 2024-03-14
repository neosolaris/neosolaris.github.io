---
title: Lynx - 터미널 텍스트 브라우저
date: 2022-12-18T12:47:45+09:00
lastmod:
tags: ['lynx','browser','terminal']
categories: ['www']
---

## INTRO
* 예전에 터미널 상에서 웹문서를 참고하기 위해 사용.
* 현재 utf-8지원 및 컬러 지원, vi key binding 지원 등 다양한 기능 보유.
* 광고나 현란한 그림들, 그리고 하얀 화면으로부터 눈을 보호하자.
* 기술문서나 신문기사 또는 문서 위주의 작업을 주로 할 때 빠르고 간결.
* CPU와 MEMORY를 타 브라우저 보다 적게 사용하는 그야말로 친환경 브라우저.
* tmux에서 vim과 함께 사용하면 환상의 궁합이라 말할 수 있겠다.

## INSTALL

* Debian, Ubuntu
```console
$ sudo apt install lynx
$ lynx --version
$ lynx duckduckgo.com
```

* Alpine
```console
$ doas apk add lynx
```

## SETUP

* Vi Key 설정 - 화면 이동을 hjkl로 변경
```
1. 실행 후 `o` 명령으로 옵션 설정
2. VI keys -> [ON] 으로
3. Line edit style -> [Bash-like Bindings] 로 설정
4. 화면 상단에 Save options to disk: [x] 표시
5. 화면 가장 윗줄에 Accept Changes 클릭
```

## Usage
```
화살키 <- 이전 웹페이지로 이동 
화살키 -> 이후 웹페이지로 이동
화살키 up 페이지 상단으로 이동
화살키 down 페이지 하단으로 이동

h 도움말
o 옵션
p 프린트
g 입력한 사이트로 이동
m 메인으로
q 종료
/= 검색
delete= 히스토리 리스트
```

## Links
* tmux home: <https://lynx.browser.org>
