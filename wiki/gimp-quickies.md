---
title: Gimp - Quickies 사이즈 변경, 잘라내기, 회전, 뒤집기
date: 2023-01-12T06:26:11+09:00
lastmod:
tags: ['gimp','size','rotate','flip']
categories: ['graphic']
---

## 이미지 기본 용어
* dpi(Dot per Inch) - 가로 세로 1 인치 당 점(Dot:둥근점)의 수, 인쇄에서 주로 사용
* ppi(Pixel per Inch) - 가로 세로 1 인치 당 픽셀(Pixel:화소,사각점)의 수, 모니터에서 주로 사용
* 1 Inch - 2.54Cm
* DPI 해상도별 용도
  - 사진 출력: 400 dpi
  - 책, 포스터: 300 dpi
  - 웹, 홈페이지: 72 dpi

## 이미지 사이즈 변경
* [APOD](https://apod.nasa.gov/apod/astropix.html)(Astronomy Picture of the Day) 사이트에서 말머리성운(The Horsehead Nebula in Infrared) 사진을 받아온다. <https://apod.nasa.gov/apod/ap130422.html>
* 파일을 열고 정보를 확인한 다음 필요한 사이즈로 변경한다.

1. 파일 열기 - `File > Open` sRGB 유형 선택
  - `keep` 기존 - sRGB IEC61966-2.1 
  - `convert` 변경 - Gimp built-in sRGB
1. 파일정보 보기 (Image Properties)
  - `Alt + Enter` : `Image > Image Properties`
1. 사이즈 변경 (Scale Image)
  - `Image > Scale Image`
  - width 를 1225 -> 600 으로 조정 (자동 비례 조정)
  - pixels, percent
  - `Scale` 클릭
1. 변경된 파일 정보를 보기 (Image Properties)
  - `Alt + Enter` : `Image > Image Properties`
1. 저장하기
  - `Ctrl + E` : `File > Export to 파일명.jpg` - jpg로 저장
  - `Shift + Ctrl + E` : `File > Export as...` - 다른 포맷으로 저장
  
## JPEG로 저장
* JPEG: Lossy compression Algorithm
* 용량은 효율적 알고리즘으로 줄일 수 있으나 품질에 손실을 준다.

## 이미지 잘라내기 - Crop an Image
* 원본 이미지를 불러와 필요한 영역으로 잘라내는 것.

* Crop an Image
  - `Shift + C` - `Tools > Transform Tools > Crop`

* Another Crop an Image
  - Select 툴(`r`)로 영역 선택 후 `Image > Crop to Selection`
  
## 회전(Rotate)과 뒤집기(Flip)
* `Image > Image Transform`
  - Flip Horizontally (수평으로 뒤집기)
  - Flip Vertically (수직으로 뒤집기)
  - Rotate Clockwise (시계방향으로 회전)
  - Rotate Counter Clockwiser (반시계방향으로 회전)

## Links
<https://www.gimp.org/tutorials/GIMP_Quickies/>
