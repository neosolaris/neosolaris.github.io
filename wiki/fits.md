---
title: FITS - Flexible Image Transport System
date: 2022-10-09T18:12:36+09:00
lastmod: 2022-10-11T15:43:10+09:00
tags: ['fits','format','astronomy']
categories: ['graphic']
---

## Intro

* FITS는 Flexible Image Transport System로 오픈 표준 디지털 파일 포맷이다.
* 주로 천문사진에 사용되는 포맷이다.
* 천문관측 사진을 직접 촬영하고 편집해도 된다.
* 그러나 FITS는 개인의 비용과 노력으로 얻을 수 없는 고사양 고품질의 사진과 포맷을 제공한다.
* 천문사진에 관심이 있다면 FITS 포맷을 잘 알아야 하는 이유가 있다.
* 천체를 연구하고 공개된 데이터를 이용하여 은하를 시각적으로 완성하는 일
* 이를 위해 FITS에 대해 알아보고 어떻게 다루어야 하는지를 정리한다.

## 파일 포맷

* 단순한 이미지만을 다루는 포맷이 아니라 여러 정보를 함께 넣을 수 있다.
* 기본 구조는 `Primary Header` + `SCI(header:data)` + `ERR(header:data) DQ(header:data)` 로 되어 있다.
* 하나의 파일에 여러 종류의 데이터를 담을 수 있다.
* 스펙트럼이나 광도곡선, 데이터 큐브 등의 관련 정보를 담을 수 있다.
* 즉, 하나의 천체를 관측하면 하나의 파일에 여러개의 프레임으로 데이터를 저장할 수 있다.
* Header: 천체의 관측기, 관측날짜, 노출시간, CCD의 사양 등
* Data: 이미지 픽셀값, 천체의 flux값, 관측시간, 관측 파장 등
* 비유를 들자면 어떤 천체를 관측할 때 한 종이에 그림을 그리고 좌표나 기타 정보를 같이 기록해 두는 것과 같다.
* 확장자: `.fits`, `.fit`, `.fts`

## 편집 소프트웨어
* [siril](siril) - FITS Edit: 천문사진 전처리 또는 이미지 프로세싱 소프트웨어
* [iraf](iraf), - 미국 천문관측기관(NOAO)의 천문사진 프로세싱: clang
* [gimp](gimp) - 그래픽툴, FITS 편집 가능
* [photoshop](photoshop) - 그래픽툴, FITS 편집 가능, 유료, 윈도우즈 전용
* [imagej](imagej) - FIT 편집 통합 툴
* [fits liberator](fits-liberator) - 유럽, 나사에서 사용하는 전처리 툴(ubuntu:libfitsio)

## FITS LIBRARY
* [astropy](astropy) - pyfits 포함 천문관측 모듈: anaconda 기본 모듈
* [pyraf](pyraf) - 미국 천문관측기관(NOAO)의 천문사진 프로세싱: python
* [pyfits](pyfits) - fits 편집 모듈: python
* [fitsio](fitsio) - fits 라이브러리: clang

## 보기 소프트웨어
* [fv](fv) - FITS Viewer: 오래된 툴, 조금 촌스럽다.
* [gimp](gimp) - 그래픽툴, 파일보기 및 다른 포맷 변환
* [ds9](ds9) - FITS Viewer (ubuntu:saods9)

## Guides

* Here's how to edit James Webb Space Telescope images: Judy Schmidt 인터뷰
  - <https://www.space.com/james-webb-space-telescope-image-editing>
* FITS Liberator User Guide
  - <https://esahubble.org/static/projects/fits_liberator/v301files/userguide.pdf>
* NEW IRAF ABC (IRAF를 이용한 측광 자료 전처리)
  - <https://astro.kias.re.kr/~hshwang/NEW_IRAF_ABC.pdf>

## Links

* FITS HOME - <https://fits.gsfc.nasa.gov/>
* FITS i/o libraries - <https://fits.gsfc.nasa.gov/fits_libraries.html>
* 위키백과 FITS - <https://en.wikipedia.org/wiki/FITS>
* Fits 관련 소프트웨어 리스트 - <https://fits.gsfc.nasa.gov/fits_viewer.html>
* Short Introduction of Image Processing <https://noirlab.edu/public/media/archives/techdocs/pdf/techdoc027.pdf>
