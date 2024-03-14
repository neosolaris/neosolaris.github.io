---
title: Fritzing
date: 2023-12-13T11:49:32+09:00
lastmod:
tags: ['tools','fritzing','iot','회로도']
categories: ['tools']
---

## Intro
* nodemcu나 arduino를 이용한 회로 설계에 활용

## Install
* 깃허브 개발용을 설치
    - <https://github.com/fritzing/fritzing-app/releases>
    - 자신의 OS에 맞는 것을 선택 (ex. Windows: fritzing-xxx-develop-548.windows.64.zip)
* 압축을 풀고 적당한 곳에 옮긴 후 실행파일을 바탕화면에 링크복사
* 실행
    - parts관련 업데이트 창: clean parts선택 후 업데이트
    - windows User Files Folder: `C:\Users\사용자명\OneDrive\문서\Fritzing`
    
## Nodemcu parts 등록하기
* 기본 설치시 esp32, esp8266이 없으므로 사용자 등록을 해준다.
* [esp32-parts]
    - <https://forum.fritzing.org/uploads/default/original/2X/8/8d99adbb2e8f966178bdb46f5cffa7bd72ce2c2a.fzpz>
* [esp8266-parts]
    - <https://blog-cms.tasnimzotder.com/content/files/2022/01/NodeMCU-V1.0-1.fzpz>
* 다운받은 파일을 우측상단 Parts 패널의 `부메뉴>import`를 클릭하여 로드한다.
* Parts 패널에 `Mine>My parts`에 등록된 것을 확인한다.
* import하여 등록한 parts는 `C:\Users\사용자명\OneDrive\문서\Fritzing` 이하에 저장된다.
* 따라서 이를 백업해두면 나중에 쉽게 자신의 환경을 복원할 수 있다.

## REFERENCE
* Fritzing Home: <https://fritzing.org/>
* Fritzing Github: <https://github.com/fritzing/fritzing-app>
* learning Fritzing: <https://fritzing.org/learning/>
