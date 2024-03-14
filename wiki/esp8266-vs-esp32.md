---
title: ESP8266 vs ESP32
date: 2023-12-17T06:50:32+09:00
lastmod:
tags: ['esp32','esp8266','iot']
categories: ['nodemcu']
---

## 비교표
* 아래 링크를 참조한다. 보다 자세하고 충분한 설명이 있다.
    - <https://makeradvisor.com/esp32-vs-esp8266/>

|내용 |ESP8266 |ESP32 |
|------|---------|-------|
|MCU |Xtensa Single-core 32-bit L106 |Xtensa Dual-Core 32-bit LX6 with 600 DMIPS|
|802.11 b/g/n Wi-Fi |HT20| HT40|
|Bluetooth |X |Bluetooth 4.2 and BLE|
|Typical Frequency |80 MHz |160 MHz|
|SRAM |X |✓|
|Flash |X |✓|
|GPIO |17 |36|
|Hardware /Software PWM |None / 8 channels |None / 16 channels|
|SPI/I2C/I2S/UART |2/1/2/2 |4/2/2/2|
|ADC |10-bit |12-bit|
|CAN |X |✓|
|Ethernet MAC Interface |X |✓|
|Touch Sensor |X |✓|
|Temperature Sensor|X |✓(old versions)|
|Working Temperature |-40ºC to 125ºC |-40ºC to 125ºC |
|Hall effect sensor|X |✓|
|Price	$ |(3$ – $6) |($6 – $12)|

## 개발보드

* ESP32
![ESP32](https://makeradvisor.com/wp-content/uploads/2018/04/ESP32-DOIT-DEVKIT-V1-Board-Pinout-36-GPIOs-Copy.jpg)

* ESP8266
![ESP8266](https://makeradvisor.com/wp-content/uploads/2020/05/ESP8266-NodeMCU-kit-12-E-pinout-gpio-pin.png)

## REFERENCE
* esp32-vs-esp8266 - <https://makeradvisor.com/esp32-vs-esp8266/>
