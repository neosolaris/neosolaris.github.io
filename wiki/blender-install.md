---
title: How to Install Blender on Ubuntu 22.04 LTS
date: 2022-08-29T17:59:40+09:00
lastmod:
tags: ["blender","ubuntu","install"]
categories: ["3d-modeling"]
---

## 기존 설치 제거
* apt version
```console
if [ "$(which blender)" == "/usr/bin/blender" ];then
	sudo apt autoremove blender
fi
```

* snap version
```console
if [ "$(which blender)" == "/snap/bin/blender" ];then
	sudo snap remove blender
fi
```

## Add Repository PPA APT
```console
sudo add-apt-repository ppa:savoury1/blender -y
sudo add-apt-repository ppa:savoury1/ffmpeg4 -y
sudo add-apt-repository ppa:savoury1/ffmpeg5 -y
sudo add-apt-repository ppa:savoury1/graphics -y
sudo add-apt-repository ppa:savoury1/display -y
```

## Apt Update and Blender Install
```console
sudo apt update
sudo apt upgrade
sudo apt install blender -y
```

## Reference
* <https://www.linuxcapable.com/how-to-install-blender-on-ubuntu-22-04-lts>
