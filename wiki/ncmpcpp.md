---
title: NCMPCPP - NCurses Music Player Client (Plus Plus)
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-24T03:53:45+09:00
tags: ["ncmpcpp","mpd","music"]
categories: ["music","linux"]
---

* 2023-08-25: 문서 수정, 사용법 Usage 추가
* 설치하고 기본설정으로 사용하여도 무난하다.

## Install

```console
sudo apt install ncmpcpp
ncmpcpp --version
```

## Setup

* 설정파일 편집

```console
vim ~/.config/ncmpcpp/config
```

* 설정파일 내용

```
mpd_host = 192.168.1.100
mpd_port = 6600

# Enabling visualization (mpd 호스트 내에서만 동작가능)
visualizer_data_source = "/tmp/mpd.fifo"
visualizer_output_name = "my_fifo"
visualizer_in_stereo = "yes"
visualizer_type = "spectrum"
visualizer_look = "+|"
visualizer_look = "●▮"
```

설정에 관한 보다 자세한 예시

`/usr/share/doc/ncmpcpp/example/config`

## Enableing Visualization

* 음악감상시 비주얼한 음변화를 볼 수 있는 기능
* 이 기능을 위해 위의 주석을 제거하고 실행한다.
* 단, mpd와 동일한 시스템에서 가능하다.
* /etc/mpd.conf 에 다음과 같이 설정하고 mpd를 재실행한다.

```
audio_output {
    type                    "fifo"
    name                    "my_fifo"
    path                    "/tmp/mpd.fifo"
    format                  "44100:16:2"
}
```

## Usage
```
$ ncmpcpp
```

- `F1` : show help
- `1` : show playlist ;
- `2` : show directory browser
- `3` : show search
- `4` : show library
- `5` : playlist editor
- `6` : tags editor
- `8` : visualizer
- `p` : toggle play/pause
- `a` : add selection to playlist
- `>` : play next track
- `<` :play previous track


## Reference

* [AchiLinux Ncmpcpp Wiki](https://wiki.archlinux.org/title/Ncmpcpp)
* [Ncmpcpp GitHub](https://github.com/ncmpcpp/ncmpcpp)
