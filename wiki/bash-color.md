---
title: Bash Color
date: 2023-08-10T17:03:38+09:00
lastmod:
tags: ['bash', 'color', 'prgramming']
categories: ['bash']
---

## Intro
- Bash에서 Color를 표현하는 방법을 알아본다.
- bash로 작성한 프로그램의 출력이나  프롬프트를 예쁘게 표현해 보자.
- 그러나 지나친 시간 투자 보다는 색깔이 주는 주목성과 구분력, 편한함, 간결함에 집중하자.

## Map the colors
```console
# Color mapping
grey='\[\033[1;30m\]'
red='\[\033[0;31m\]'
RED='\[\033[1;31m\]'
green='\[\033[0;32m\]'
GREEN='\[\033[1;32m\]'
yellow='\[\033[0;33m\]'
YELLOW='\[\033[1;33m\]'
purple='\[\033[0;35m\]'
PURPLE='\[\033[1;35m\]'
white='\[\033[0;37m\]'
WHITE='\[\033[1;37m\]'
blue='\[\033[0;34m\]'
BLUE='\[\033[1;34m\]'
cyan='\[\033[0;36m\]'
CYAN='\[\033[1;36m\]'
NC='\[\033[0m\]'
```

## Bash Prompt
* `~/.bash_profile`이나 `~/.bashrc`에 다음과 같이 작성하고 다시 로그인

```bash
case $HOSTNAME in
    plato*) PSC="\e[1;33m" ;;
    *) PSC="\e[36m" ;;
esac

PS1="[\j]\[${PSC}\]\u@\h(\l) \[\e[37m\][ \w ]\[\e[00m\]\n\[\e[1m\]\#\[\e[0m\] \$ "
```


## REFERENCE
* Bash Prompt Generator : https://robotmoon.com/bash-prompt-generator/
* Customizing Bash Prompt : https://linuxopsys.com/topics/customizing-bash-prompt-in-linux-changing-colors
