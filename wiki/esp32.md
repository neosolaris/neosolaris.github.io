---
title: esp32
date: 2023-12-13T11:16:22+09:00
lastmod: 2023-12-16T07:19:03+09:00
tags: ['esp32','nodemcu','iot']
categories: ['nodemcu']
---

## Intro
* 기본 정보
    - Espressif Systems 제조, 2016년 출시
    - Wi-Fi와 블루투스 무선 통신 기능을 탑재한 저전력 마이크로컨트롤러
    - 강력한 퍼포먼스, 고성능 어플리케이션 처리
    - [esp8266](esp8266)의 업그레이드 버전

* 스펙
    * CPU - Xtensa® single-/dual-core 32-bit LX6 microprocessor(s)
    * 동작전압 - 2.7V~3.6V
    * WIFI - 802.11b/g/n (2.4 GHz)
    * 블루투스 - v4.2 BR/EDR 및 Bluetooth LE
    * IO(pinout) - 34
    * RAM - 448KB
    * SRAM - 520KB
    * 외장플래쉬 - 512KB(최소사양),OTA(on the air)최소사양(1MB)~16MB까지 지원
* 개발을 위한 준비물
    * esp32 개발 컨트롤러 (인터넷에서 구매)
    * nodemcu firmware - 직접 build하거나 배포된 이미지를 다운 받는다.
    * firmware upload tool - esptool, NodeMCU-PyFlasher
    * Esplorer - Java로 만든 GUI 개발 툴 (오픈소스, 여러 OS에 독립 실행)
* 개발방법은 아두이노IDE를 통한 개발(C언어)과 nodemcu + Esplorer를 통한 개발(Lua언어)이 있다.
* 전자는 인터넷에 많은 자료와 예제가 있으므로 이를 참조한다.
* 여기에서는 nodemcu(Lua base Firmware) + Esplorer(GUI Dev Tool)에 집중한다.

## 개발 환경 구성
* 개발 환경
    * nodemcu - Lua 기반의 펌웨어
        - 참고사이트 - <https://nodemcu.readthedocs.io/en/release/>
        - esplorer에서 사용 가능하다.
        - esp8266은 미리 빌드된 펌웨어를 제공하여 사용상 문제가 없으나 esp32는 제공되지 않는다.
        - 현재 `dev-esp32` 프로젝트는 ipf4에 통합되면서 직접 빌드는 가능하나 빌드 및 사용시 많은 문제가 발생한다.
        - LFS(Lua File System) 마운트 에러 - 부팅시 마운트 fail
        - 파티션테이블의 각 영역 주소 에러 - 특별히 부팅시 LFS 주소값이 잘못 되었다고 나옴
        - gpio 모듈 변경 - `gpio.mode` 함수가 없어짐, 대신 `gpio.config`함수 존재, nodemcu 문서에 언급 없음.
        - micropython의 다양한 빌드 이미지를 제공하는 것과 비교해 많이 실망스럽다.
        - 과거에 비해 빌드시 에러가 많고 이를 해결해도 펌웨어가 제대로 동작하지 않는다.
    * Luanode - Lua 기반의 펌웨어
        - 개인 개발 펌웨어지만 esp32에서 잘 동작한다.
        - 미리 빌드된 펌웨어를 제공한다.
        - esplorer에서 사용 가능하다.
        - 단점으로는 4년 동안 업데이트가 없고 nodemcu와 조금 다르다.
        - nodemcu 등에 비해서 충분한 모듈과 기술, 문서 등의 지원이 부족하다.
    * Xedge - Lua 기반의 펌웨어
        - 참고사이트 - <https://realtimelogic.com/ba/ESP32/source/GettingStarted.html>
        - 브라우저에서 펌웨어 다운로드 및 루아로 개발해 업로드 할 수 있는 환경.
        - 기본 웹서비스 환경을 만들고 IoT를 지원한다.
        - nodemcu와는 다른 API를 제공한다.
        - esp32와 esp32-s3만을 지원한다.
        - esp32는 일반적인 devkit은 안되고 WROVER버전 SRAM이 4MB 지원되는 모델이어야 한다.
        - 간단히 말해서 xedge는 esp32-s3를 사용할 것을 권장한다. 
        - 조사해 보았는데 국외는 0.7~1만원(배송비포함)정도이고 국내는 1.5-2만원 정도이다.
        - 이렇게 하드웨어 제약이 있기는 하지만 nodemcu에 비해 정말 훌륭한 환경을 제공하고 있다.
        - 각종 API와 이에 대한 문서를 제공하고 있다.
        - 계속해서 펌웨어와 문서가 업데이트되고 있다.
        - 단순하고 심플한 기능보다는 좀 더 다양하고 복잡한 기능을 개발할 때 좋을 듯하다.
    * Micropython - Python 기반의 펌웨어
        - 직접 빌드하는 것 뿐만 아니라 다양한 하드웨어의 펌웨어를 다운로드 받을 수 있다.
        - arduino, esp8266, esp32 등 다양한 펌웨어 이미지를 제공한다.
        - nodemcu에 비해 훨씬 견고하고 다양한 모듈과 문서를 제공한다.
        - 시리얼포트로 접속하면 반가운 파이썬 프롬프트 `>>>`가 뜬다.
        - 프롬프트 내에서 위쪽 화살키를 누르면 이전 명령어를 재 실행할 수 있다.
        - 파이썬을 좋아한다면 가장 좋은 선택이 아닐까한다.
    * Esp-idf - C, C++ 기반의 개발환경
        - espressif사에서 제공하는 개발툴(firmware build, upload, debug, examples)
        - esp칩 제조사에서 제공하므로 신뢰 및 안정적인 개발이 가능.
        - 하지만 C, C++에 능숙하고, 많은 API를 공부해야 한다.
        - 그리고 많은 소스 예제를 제공하지는 않는 것 같다.
        - 그렇다면 다음 Arduino의 C, C++ 환경이 적합하지 않을까.
    * Arduino - C, C++ 기반의 개발환경
        - Arduino IDE로 쉽게 개발할 수 있다.
        - esp-idf 툴체인보다 단순화된 코드이므로 훨씬 쉽다.
        - 수많은 사용자와 개발자들의 예제와 소스들이 가장 많다.
        
    * 결론
        - Lua기반의 esp32 개발 환경은 아직 정돈되지 못하고 불편하다.
        - 안정적이고 충분한 지원이 되는 펌웨어를 배포하는 micropython 환경이 부럽다.
        - 현 시점에서 nodemcu는 충분한 시간을 두고 틈틈히 빌드환경을 공부하고 문제점을 해결하도록 한다.
        - micropython의 장점은 컴파일 및 업로드가 생략되고 테스트가 빠르고 소스만 업로드 하므로 편리하다.
        - 하지만 arduino IDE 환경에서 개발하는 것이 편리함, 방대한 자료 및 소스 등에서 최고이다.
        - 단점이라면 컴파일 및 업로드가 조금 더 걸리는 정도이다.
        - C와 C++로 가장 표준적인 개발은 esp-idf 개발 환경이다. 


## STEP01. 하드웨어 준비: nodemcu esp32 dev kit

* usb serial driver install - CP210x_Universal_Windows_Driver
    * <https://www.silabs.com/developers/usb-to-uart-bridge-vcp-drivers>
* 장치 연결 확인
    * Windows - 장치관리자 > usb com serial port 확인
    * Linux - `lsusb`

![ESP32](https://makeradvisor.com/wp-content/uploads/2018/04/ESP32-DOIT-DEVKIT-V1-Board-Pinout-36-GPIOs-Copy.jpg)

## STEP02. NodeMCU 펌웨어

* 직접 빌드하는 것은 여러가지 문제가 있어 추후에 기술
* nodemcu esp32 firmware download
    * <https://nodemcu-build.com/> 는 현재 esp8266만을 지원하는 것으로 보인다.
    * LuaNode: 지금 시점에서 4년여 정도 지났지만 테스트용 펌웨어를 다운 받을 수 있다.
        - <https://github.com/Nicholas3388/LuaNode/tree/master/LuaNode_Esp32/firmware>
        - 펌웨어 업로드시 시작 주소값은 `0x1000`이다.
* 펌웨어를 esp32에 업로드(Flash)
    * NodeMCU-PyFlasher.exe는 주소값을 지정해서 이미지를 쓸 수가 없어서 esptool.exe를 사용한다.
    * esptool 설치
        - Python으로 만들었지만 파이썬을 따로 설치하지 않아도 된다.
        - Windows - <https://github.com/espressif/esptool/releases/download/v4.7.0/esptool-v4.7.0-win64.zip>
        - Linux - <https://github.com/espressif/esptool/releases/download/v4.7.0/esptool-v4.7.0-linux-amd64.zip>
    * esp장치의 Com 포트번호 확인 (ex. COM6)
    * 다음 명령 실행(Windows Powershell)
    ```powershell
    esptool.exe -p COM6 -b 460800 --before default_reset --after hard_reset --chip esp32  write_flash --flash_mode dio --flash_size detect --flash_freq 40m 0x1000 .\LuaNode_201705040906.bin
    ```
* 이미 설치된 펌웨어를 제거하고 다시 업로드할 때는 다음을 먼저 수행해 준다.
    ```powershell
    esptool.exe -p COM6 -b 460800 erase_flash
    ```

## STEP03. Esplorer

* esp8266, esp32 모두 사용할 수 있다.
* 자바 설치가 필요 - <https://www.java.com/en/download/>
* 다운로드 -  <https://github.com/AndiDittrich/NodeMCU-Tool>
* 따로 설치가 필요없고 압축을 풀고 esplorer.bat(Windows) 또는 esplorer.sh(Linux)를 실행
* 우측에 COM 포트 정해주고 연결(Open버튼), 속도는 (115200)
* IDE 좌측화면은 로컬 코딩 영역, 우측은 원격 장치 대화 영역
* lua 코드를 좌측화면에서 코딩 후 `Upload`또는 상단 `Save`시 `init.lua`로 저장
* esp 장치에 `RST`버튼을 눌러 reset해서 적용을 확인한다.

* Example Code - Built-in LED Test
```lua
n = 0
max = 5
LED = 2
gpio.mode(LED, gpio.OUTPUT)

while n < max do
    n = n + 1
    print(n, 'Built-in test esp32: LED(gpio #'.. LED ..')' )
    print(' --> On')
    gpio.write(LED, gpio.HIGH)
    tmr.delay(1)
    print(' --> Off')
    gpio.write(LED, gpio.LOW)
    tmr.delay(1)
end
```

* esplorer 사용법 동영상

{{< youtube ICRAlUCPpwY >}}


## STEP04. NodeMCU 개발하기

* nodemcu 레퍼런스 문서
    * 주의할 것은 <https://nodemcu.com> 의 example은 오래되어 아래 문서를 참조.
    * NodeMCU Document - <https://nodemcu.readthedocs.io/en/release/>


## REFERENCE
* NodeMCU esp32 Document - <https://nodemcu.readthedocs.io/en/dev-esp32/>
* NodeMCU custom builds - <https://nodemcu-build.com/>
* esplorer - <https://esp8266.ru/esplorer/>
