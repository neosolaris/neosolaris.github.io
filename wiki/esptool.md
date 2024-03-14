---
title: esptool - esp firmware flash upload, erase, read
date: 2023-12-19T12:23:53+09:00
lastmod:
tags: ['tags']
categories: ['categories']
---

## INTRO

* esptool은 python으로 만든 esp 펌웨어 툴이다.
* 펌웨어 읽기, 쓰기, 지우기가 가능하다.
* 기본 사용법을 숙지하고 필요에 따라 메뉴얼을 참고한다.

## INSTALL

* 다운로드 - <https://github.com/espressif/esptool/releases>

* windows - `esptool.exe`
    -  `esptool-v4.x.x-win64.zip` 압축을 풀고 esptool.exe를 사용
    -  `esptool.exe` 단일 파일로 파이썬 설치를 필요로 하지 않는다.
* Windows - `esptool.py`
    - python3를 설치한다.
    - powershell 또는 터미널창에서 pip로 설치한다.
    ```console
    pip install esptool
    esptool.py -h
    ``` 
* Linux - `esptool.py`
    - python3가 없다면 설치한다.
    ```console
    sudo apt install python3 python3-pip
    sudo pip install esptool
    esptool.py -h
    ```
    
## Flash Upload

* PORT - windows:COM#, Linux: /dev/ttyUSB#
* BAUDRATE - 460800 recommended
```console
# nodemcu build image
esptool.py -p PORT  -b BAUDRATE \
    --before default_reset \
    --after hard_reset \
    --chip esp32  write_flash \
    --flash_mode dio \
    --flash_size detect \
    --flash_freq 40m \
     0x1000 bootloader.bin \
     0x8000 partition-table.bin \
     0x10000 nodemcu.bin

# other built-in image
esptool.py -p PORT  -b 460800 \
    --before default_reset \
    --after hard_reset \
    --chip esp32  write_flash \
    --flash_mode dio \
    --flash_size detect \
    --flash_freq 40m \
     0x0 single-app.bin \
```

## Firmware Check

* PORT - windows:COM#, Linux: /dev/ttyUSB#

```console
# check flash id info
esptool.py -p PORT flash_id

# check built-in mac address
esptool.py -p PORT read_mac

# check image info
esptool.py -p PORT image_info --version 2 my_esp_app.bin
```

## Firmware Erase

* 연결된 esp32의 펌웨어 제거
* PORT - windows:COM#, Linux: /dev/ttyUSB#
* BAUDRATE - 460800 Recommended

```console
esptool.py -p $PORT -b $SPEED erase_flash
```
## Firmware Read

* esp32에 들어있는 펌웨어를 복제하는 방법
* flash_id로 flash_size를 확인 후 적용 
* 아래 예제는 0 부터 0x400000(4MB)까지 읽어서 out.bin 으로 복사하는 예.
* PORT - windows: COM#, Linux: /dev/ttyUSB#
* BAUDRATE - 460800 Recommended 

```console
# esp32의 펌웨어를 읽어 out.bin으로 저장: from 0 to 0x400000
esptool.py -p PORT -b BAUDRATE read_flash 0 0x400000 out.bin

# esp32의 펌웨어를 읽어 out.bin으로 저장: from 0 to ALL (auto detect)
esptool.py -p PORT -b BAUDRATE read_flash 0 ALL out.bin

# 저장해 놓은 out.bin을 다른 esp32에 업로드
esptool.py -p PORT  -b BAUDRATE \
    --before default_reset \
    --after hard_reset \
    --chip esp32  write_flash \
    --flash_mode dio \
    --flash_freq 40m \
    --flash_size 4MB \
     0x0 out.bin \
```

## REFERENCE
* esptool docs - <https://docs.espressif.com/projects/esptool/en/latest/esp32/>
