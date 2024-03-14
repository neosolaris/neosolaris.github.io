---
title: CVS to Sqlite3
date: 2022-11-07T21:58:56+09:00
lastmod:
tags: ['cvs','db','sqlite3']
categories: ['devel']
---

## Intro

* csv 파일을 sqlite3 기본기능으로 불러 테이블에 저장할 수 있다.
* sqlite3의 interactive, command mode 사용법
  
## Howto

```console
$ cd data/
$ sqlite3 mydata.db  # 저장할 db를 정하고 실행
sqlite> .mode csv  # csv모드로 전환 
sqlite> .import data.csv mytable  # mytable 테이블로 data.csv를 변환
sqlite> .dbinfo  # db 정보확인
sqlite> .tables  # 테이블 확인
sqlite> .schema mytable  # mytable의 스키마 확인
sqlite> .mode column  # 컬럼표시
sqlite> .headers on  # 헤더표시
sqlite> select * from mytable where ...  # 테이블 쿼리 
sqlite> .q  # 종료
$ ls -l mydata.db  # DB사이즈 확인
```

* 명령라인에서 확인할 수도 있다.
```console
$ sqlite3 mydata.db  -header -column  "select x from y;"
```
