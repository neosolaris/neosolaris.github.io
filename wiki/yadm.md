---
title: yadm - Yet Another Dotfiles Manager
date: 2022-09-01T16:55:30+09:00
lastmod:
tags: ["yadm", "dotfiles"]
categories:
---

## Intro

* dotfiles를 백업 및 관리해 주는 툴은 많이 있다. [참조](https://dotfiles.github.io/utilities/)
* 나중에 재설치하거나 다른 컴퓨터에서 이 설정들을 복원하려면 매우 번거롭다.
* yadm은 그 중 git 외에 의존성이 매우 적으며, 사용하기 쉽고 편리하다.
* 데비안이나 우분투 사용자라면 패키지로 쉽게 설치할 수 있다.
* 좋은 문서로 잘 안내하고 있다.

## Install and Setup

* [github](github)에 `github.com/user_name/dotfiles` 저장소를 만든다. 공개/비공개 자신의 목적에 맞게 선택

* install
```console
$ sudo apt install yadm
```

* 기본 사용법 - git과 거의 같다. 오직 dotfiles만 관리한다고 보면 된다.
```console
$ yadm init         # ~/.local/share/yadm/repo.git/ 로컬 저장소 생성
$ yadm remote add origin git@github.com:user_name/dotfiles # 원격지 추가

$ yadm add <파일명> # 관리할 파일을 추가
$ yadm list         # 관리 리스트 확인
$ yadm commit -m "update files"      # 커밋
$ yadm push                         # push error가 나는 경우 아래 실행

$ cd ~/.local/share/yadm/repo.git && git push --set-upstream origin main
```

## 참고사항

* yadm의 기준은 사용자 홈디렉토리이다. 
* 만약 권한이 없는 `/etc` 등의 주요 설정파일도 백업하려면 어떻게 해야 하는가.
* 당분간은 홈에 디렉토리를 만들고 복사해 둔 다음 yadm에 추가해서 사용.
