---
title: vim-devicons
date: 2022-08-26T02:01:55+09:00
lastmod: 2022-08-26T02:03:42+09:00
tags: ["vim","devicons","plugin"]
categories: ["editor"]
---                                                                         

## 소개

vim이 터미널에서 동작하므로 아이콘을 표시하기가 좋지 않다. 색깔과 모양을 미려하게 바꾸어 준다. 개인적인 관점에서 보면 상당히 매력적이다. 삭막한 검은 배경에 글씨만 보이다가 꽃이 피고 그림이 여기 저기 있는 느낌이다. 거기에다 아름다우면서도 절제된 것이 작업 집중력을 결코 떨어 뜨리는 것도 아니다. 적극 추천한다.

* <https://github.com/ryanoasis/vim-devicons> 이 곳에 가면 샘플 사진과 설치법이 자세히 나와있다.
* 적용되는 플러그인: [NERDTree](NERDTree),[vim airline](vim-airline), CtrlP, powerline, denite, unite, lightline.vim, [vim startify](startify), vimfiler, vim-buffet and flagship.
* 물론 폰트를 설치하면 zsh, bash 등에서도 프롬프트 표시를 지원한다.

## 폰트 설치

* vim-devicons를 설치하기 전에 먼저 Nerd Patched 폰트를 설치해야 한다.
* 폰트는 다양한데 모두 설치한다면 많은 용량을 차지하므로 여기에서는 `Noto Nerd Font` 폰트만 설치했다.
* 참고로 폰트를 받을 수 있는 사이트이다. [nerd-fonts](https://www.nerdfonts.com/font-downloads)
* 깃허브 사이트와 설치 안내도 있다. <https://github.com/ryanoasis/nerd-fonts>
* 모두 설치하면 용량이 약 1.2GB로 매우 크므로 다음 스크립트에서 Noto와 Hack만 설치한다.
* 실행하면 `~/.local/share/fonts`에 설치된다.
* 설치 후 자신이 사용하는 터미널설정에서 폰트를 `Noto Nerd font`로 설정해주면 준비가 완료된다.

```bash
#!/bin/bash

declare -a fonts=(
    BitstreamVeraSansMono
    CodeNewRoman
    DroidSansMono
    FiraCode
    FiraMono
    Go-Mono
    Hack
    Hermit
    JetBrainsMono
    Meslo
    Noto
    Overpass
    ProggyClean
    RobotoMono
    SourceCodePro
    SpaceMono
    Ubuntu
    UbuntuMono
)

version='2.1.0'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
    echo "Downloading $download_url"
    wget "$download_url"
    unzip "$zip_file" -d "$fonts_dir"
    rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv
```

## 설치 및 설정

* `~/.vimrc` 또는 `~/.config/nvim/init.vim` 설정
```vimrc
Plug 'ryanoasis/vim-devicons'
...
set encoding=UTF-8
```

* 설치
```console
nvim +plugInstall  +qall
```

* 터미널 설정에서 폰트를 `Noto Nerd Font`를 설정해 주고 [vim](vim) 또는 [nvim](nvim) 을 사용하면 된다.

## Links
  
* <https://github.com/ryanoasis/vim-devicons> 
* <https://www.nerdfonts.com/font-downloads>
* <https://github.com/ryanoasis/nerd-fonts>
