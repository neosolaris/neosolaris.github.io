---
title: Archlinux Install - 아치리눅스 설치
date: 2022-09-15T21:46:46+09:00
lastmod:
tags: ["archlinux","linux", "install"]
categories: ["linux"]
---

## TODO

* [ ] 한글 환경 구성하기
* [ ] 대체할 터미널 프로그램 알아보기 또는 기존 것 재 설정
* [ ] 설치 스크립트 또는 요약본 만들기
* [ ] pacman 사용법 따로 정리 - 상위 문서로
* [ ] archlinux의 주 용도를 정하고 이에 맞게 구성하고 문서 정리
* [ ] aur 및 yay 설치 및 사용법 정리: https://linuxhint.com/aur_arch_linux/

## Intro

* 아치리눅스는 설치환경이 터미널에서 시작한다.
* 하나씩 설치하고 설정해 나가는 방식이다.
* 다른 배포판과는 다르게 재설치 없이 한 번 설치 후 계속 업데이트 해서 사용한다.
* 초반에만 기본을 잘 설치하고 조금씩 가꾸는 재미가 있다.

## 설치 이미지 준비

* 최신 설치 이미지 다운로드 및 USB 부트 만들기
```console
$ wget http://mirror.anigil.com/archlinux/iso/2022.09.03/archlinux-2022.09.03-x86_64.iso
$ lsusb  # 자신의 USB 장치 확인
$ sudo dd bs=4M if=archlinux-2022.09.03-x86_64.iso of=/dev/sda
```

* 설치할 시스템에 USB 부팅 BIOS 설정: 부팅 순서 조정 후 부팅
* 자신의 시스템이 BIOS인지 UEFI인지 확인은 다음과 같다.
```console
# ls /sys/firmware/efi     #디렉토리 존재 여부 확인
```

## Install Arch

* wifi 설정

```console
# ip link  # wifi 장치 및 연결 확인
# iwctl --passphrase 'mypassword' station wlan0 connect mywifi-ssid  # 연결
# ping google.com   # 인터넷 연결 확인
# reflector -–verbose -c “Korea” --sort rate > /etc/pacman.d/mirrorlist
# pacman -Syy       # update os base
```

* 파티션 설정 및 파일 시스템 생성
```console
# lsblk             # 내 드라이브 장치 확인
# fdisk -l /dev/sda # 설치 드라이브 파티션 정보 확인
# fdisk /dev/sda    # 파티션 설정: sda1(83:Linux)은 root(115GB), sda2(82:Swap) swap(4GB)

# mkfs -t ext4 /dev/sda1
# mount /dev/sda1 /mnt
# mkdir /mnt/boot

# mkswap /dev/sda2
# swapon /dev/sda2
```

* 기본 OS를 /mnt에 설치하기
```console
# pacstrap -i /mnt base linux linux-firmware sudo vim
```

## Setup

```console
# genfstab -U -p /mnt >> /mnt/etc/fstab  # fstab 생성
# cat /mnt/etc/fstab                     # 확인

# arch-chroot /mnt                       # root를 /mnt로 변경 

# ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime  # timezone
# timedatectl set-ntp true  # ntp로 시간 동기화
# hwclock --systohc         # 하드웨어 시간도 맞춤
# date                      # 확인

# vim /etc/locale.gen       # en_US.UTF-8, ko_KR.UTF-8 주석 제거
# locale-gen                # 로케일 설정 및 파일 생성
# echo LANG=en_US.UTF-8 >  /etc/locale.conf      # 로케일 설정

# echo "host_name" > /etc/hostname  # 호스트명 등록
# cat <<EOF > /etc/hosts            # hosts파일 등록
127.0.0.1        localhost
::1              localhost
EOF

# passwd                    # root 패스워드 설정
# useradd -m -G wheel -s /bin/bash borisu  # 사용자 등록
# passwd borisu                            # 사용자 패스워드 설정
# vim /etc/sudoers                         # borisu ALL=(ALL) ALL 추가 

# pacman -S grub                       # grub 패키지 설치
# grub-install /dev/sda                # grub 디스크에 설치
# grub-mkconfig -o /boot/grub/grub.cfg # 설정파일 만들기
# ls /boot                             # 확인

# pacman -S networkmanager          # 네트웍 매니저 설치
# systemctl enable NetworkManager   # 부팅시 자동 실행

# exit            # 나가기
umount -R /mnt    # 언마운트
reboot            # 재부팅
```

## 재부팅 후 네트웍 재설정

* 최초로 부팅시 한 번만 등록해 주면 된다.
```console
$ sudo nmcli dev wifi connect <wifi-ssid> password <'wifi-passowrd'>
```

## 추가 패키지 설치
```console
$ sudo pacman -Syu
$ sudo pacman -S base-devel man-db man-pages wget neovim 
```

## KDE 플라즈마 GUI 설치

* 설치 중에 물어보는 것은 모두 디폴트로 설치
```console
$ sudo pacman -S xorg plasma plasma-wayland-session kde-applications firefox
$ sudo systemctl enable sddm   # Enable Display Drivers
$ sudo reboot                  # 재부팅
```

## 한글 환경 구성

```console
$ sudo pacman -S noto-fonts-cjk ttf-dejavu
```

## 참고 사항

* 가급적 패키지는 `pacman`으로 설치한다.
* `aur` 패키지는 꼭 필요한 경우만 설치하고 관리자로 `yay`를 쓴다.

## Links

* How to Install Arch Linux 2021
  - <https://techofide.com/blogs/how-to-install-arch-linux-2021-installation-guide-techofide/>
* 아치리눅스 위키 <https://wiki.archlinux.org>
