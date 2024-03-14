---
title: SpaceVim - A community-driven vim distribution
date: 2022-09-09T12:09:09+09:00
lastmod:
tags: ["vim","spacevim"]
categories: ["editor"]
---

## 설치
* vim 또는 neovim을 먼저 설치한다.
* 둘 다 설치되어 있는 경우 하나만 동작하도록 아래 명령어로 설치한다.
```console
   $ curl -sLf https://spacevim.org/install.sh | bash -s -- --install vim
   $ curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim
   $ vim ~/.config/nvim
```

* 아래 레퍼런스를 참고한다.
* 사용하는 코딩 언어를 layer로 등록해주면 거의 모든 것이 해결된다.
* 아울러 각 언어에 대한 설정법도 참고 (단축키도 정리)

## vimproc Error

* neovim으로 spacevim을 설치하고 실행했는데 위 에러가 나는 경우
``` console
   $ cd ~/.SpaceVim/bundle/vimproc.vim
   $ make
   $ nvim
```

## Links

* Quick Start Guide
<https://spacevim.org/quick-start-guide/>
* Python Set
<https://spacevim.org/use-vim-as-a-python-ide/>
* Rust Set
<https://spacevim.org/use-vim-as-a-rust-ide/>

