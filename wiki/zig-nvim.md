---
title: Zig + Nvim 설정
date: 2024-03-12T03:46:08+09:00
tags: ['zig','nvim','lsp','language','server']
categories: ['zig','nvim']
---

## Intro
* neovim에서 zig 설정 방법을 설명한다.

## Install on Alpine
* 설치하기
```console
doas apk add zig zls neovim
nvim ~/.local/nvim/init.lua
    require 'lspconfig'.zls.setup{}
```

* 다른 어떤 언어보다도 간단하다.
* zls는 zig language server
* lspconfig는 neovim에 내장된 LSP 설정을 말한다.
* nvim 설정 후 zig파일을 열고 코딩하면 도움말이 나타난다.
* `tab`으로 이동하고 `Enter`로 선택한다.

## Install zls from Source (최신 버전 소스 컴파일)
* 최신 버전의 zig(현재 0.12)여야 git 소스로 컴파일 된다.
* zig 최신 버전은 zig 홈에서 다운로드할 수 있다.
* 다음 절차에 따라 빌드한다.

```console
git clone https://github.com/zigtools/zls
cd zls
zig build -Doptimize=ReleaseSafe
mkdir ~/bin && cp zig-out/bin/zls ~/bin
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
zls --version
```

## Links
* Neovim setup for Zig  
<https://terminalprogrammer.com/neovim-setup-for-zig>
