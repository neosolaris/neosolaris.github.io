---
title: zsh install and setup
date: 2022-09-02T15:13:12+09:00
lastmod:
tags: ["zsh","install"]
categories: ["shell"]
---

## zsh 설치
```console
$ sudo apt install zsh
```

## 기본쉘 변경
```console
$ chsh -s /usr/bin/zsh
```

## Oh-My-Zsh 설치
```console
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 테마변경

```console
$ vim ~/.zshrc
$ source ~/.zsh
```
* `.zshrc` 설정 변경
  
```
ZSH_THEME="agnoster"
```

## 해결되지 않은 문제
* 기본쉘을 zsh로 했을 때 한글 입력이 되지 않는다.
* [bash](bash)의 서브쉘로 실행했을 때는 한글 입력이 잘 된다.

## Reference

* Ubuntu/Linux Oh my zsh 세팅
	- <https://polarcompass.tistory.com/142>
    - <https://github.com/powerline/fonts>
