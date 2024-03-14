---
title: Arduino-cli - 아두이노 명령라인 사용
date: 2023-10-30T15:55:50+09:00
lastmod: 2023-10-31T08:11:51+09:00
tags: ['arduino','arduino-cli','commandline','아두이노','cli','명령줄']
categories: ['arduino']
---

## Intro
* arduino-cli는 아두이노 IDE의 명령라인 툴이다. (소프트웨어 툴)
* Shell Script로 여러 번거로운 작업을 자동화 할 수 있다.
* [nvim](nvim) 이나 vim에서 개발할 수 있는 환경에 적용할 수 있다.
* nvim을 중심으로 코드 작성, 컴파일, 디버깅을 모두 처리할 수 있다.
* 설치 및 사용환경: windows, windows-wsl2-alpine, linux-ubuntu

## Intall: Windows
* reference: https://dumblebots.com/2020/08/02/arduino-cli-getting-started-windows/
* 윈도우즈용 arduino-cli.exe를 다운받아 설치, dos-shell 또는 powershell에서 경로 추가하고 사용
* 이를 윈도우즈 wsl2 기반의 리눅스에서 사용할 경우 `/mnt/c/<이하경로>`로 접근 가능하다. PATH에 추가.

## Install: Linux
* 일반사용자의 경우 `~/bin`에 설치: PATH에 추가
```
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
```

## Install: windows-wsl2-alpine
* reference: https://github.com/dorssel/usbipd-win/wiki/WSL-support
* 아두이노 장치를 USB에 연결한다.
* wsl2-alpine - gcompat, usbip, hwdata 설치
    - gcompat은 ardunino-cli로 컴파일할 때 ld-linux-x86-64.so.2 사용하는데 alpine은 musl 기반이므로 호환 지원 패키지를 설치해야 한다.
    - usbip는 usbipd의 클라이언트 패키지
    - hwdata는 USB등의 장치파일
    - ardunino-cli 사용자 설치시에 USB장치 소유권 문제가 있다. 장치 소유권을 해당 사용자로 변경한다.
* windows - usbipd-win 설치 및 설정
    - usbipd는 윈도우즈에서 wsl2 등에 USB 장치를 공유해주는 데몬 프로그램
    - 반드시 관리자 권한으로 실행해 주어야한다.
    - 아두이노 장치를 wsl2에 붙여 주었을 경우 윈도우에서는 사용할 수 없다.
    - 이 데몬은 usbip 클라이언트의 요청을 통해 USB장치(여기에서는 아두이노)를 공유

```
# WSL2-Alpine Linux: Pre-Package Install
doas apk update
doas apk add gcompat linux-tools-usbip hwdata

# Windows-Powershell 
# 관리자권한으로 실행, 윈도우즈 재부팅시 다시 설정해주어야 한다. 
# 연결시 자동 attach 방법을 모색할 필요가 있다.
# usbipd를 설치하고 wsl list를 통해 아두이노의 busid를 확인하고 이를 연결하고 확인.
winget usbipd
usbipd wsl list
usbipd wsl attach --busid=2-2
usbipd wsl list

# WSL2-Alpine Linux: arduino-cli Install
# usb 지원여부 확인
# ardunino-cli 설치 및 패스 설정
# 장치 소유권 현 사용자로 변경
lsusb
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
export PATH=$PATH:$HOME/bin
arduino-cli board list
doas chown -R <user_id>:<user_id> /dev/ttyACM0
arduino-cli --help
```

## Install: debian, ubuntu

```
lsusb
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
export PATH=$PATH:$HOME/bin
arduino-cli board list
sudo chown -R <user_id>:<user_id> /dev/ttyACM0
arduino-cli --help
```

## 시작하기
* reference: https://arduino.github.io/arduino-cli/0.35/getting-started/
* 아래는 Ardunino UNO의 경우

```
# 도움말
arduino-cli help
arduino-cli help core

# 설정 파일 초기화 (~/.arduino15/arduino-cli.yaml)
arduino-cli config init

# 장치와 연결하기 (Arduino UNO)
arduino-cli board list
arduino-cli core update-index
arduino-cli core install arduino:avr
arduino-cli board listall mkr  # list의 보드가 Unknown으로 나올 경우
arduino-cli board list

# 소스 작성 (동일한 스케치 이름의 폴더와 파일이 필요)
# 다른 방법: arduino-cli sketch new myfirst && vim myfirst/myfirst.ino
mkdir myfirst
cat<<EOF > myfirst/myfirst.ino
void setup() {
    pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
    digitalWrite(LED_BUILTIN, HIGH);
    delay(1000);
    digitalWrite(LED_BUILTIN, LOW);
    delay(1000);
}

# 컴파일과 업로드하기 (upload시 자동 컴파일)
# 장치명 확인: ardunino-cli board list
# 컴파일(-b)
arduino-cli compile --fqbn arduino:avr:uno myfirst 
# 업로드 (-u)
arduino-cli upload  -p /dev/ttyACM0 --fqbn arduino:avr:uno myfirst
# 컴파일(-b) & 업로드(-u)
arduino-cli compile -p /dev/ttyACM0 -u arduino:avr:uno myfirst
```

## REFERENCE
* ardunino-cli 설치 및 시작 - https://arduino.github.io/arduino-cli/0.35/getting-started/
* 윈도우즈 설치 및 안내 - https://dumblebots.com/2020/08/02/arduino-cli-getting-started-windows/
* wsl2에서 usb장치 연결 - https://github.com/dorssel/usbipd-win
* ardunino-cli linux install - https://m.blog.naver.com/roboholic84/221815428642
