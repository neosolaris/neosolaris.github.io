---
title: Json to sqlite3 import howto
date: 2022-11-07T22:08:17+09:00
lastmod:
tags: ['json','sqlite3','db']
categories: ['devel']
---

## Intro
* json파일을 sqlite3에 import하는 방법
* json -> csv -> sqlite3 순서로 진행한다.
* jq, sqlite3가 사전에 설치되어 있어야 한다.
* jq는 경량 명령라인 json 관리 프로그램이다.

## Requirement
```console
$ sudo apt install sqlite3
$ sudo apt install jq
```

## Getting the CSV
```console
$ cat data.json
{"uri":"/","user_agent":"example1"}
{"uri":"/foobar","user_agent":"example1"}
{"uri":"/","user_agent":"example2"}
{"uri":"/foobar","user_agent":"example3"}

$ head -1 data.json | jq -r 'keys | @csv'
"uri","user_agent"

$ jq -r 'map(tostring) | @csv' < data.json
"/","example1"
"/foobar","example1"
"/","example2"
"/foobar","example3"

$ % (head -1 data.json | jq -r 'keys | @csv' && jq -r 'map(tostring) | @csv' < data.json) > data.csv
```

## Loading it into sqlite3
```console
$ sqlite3 somedata.db
sqlite> .mode csv
sqlite> .import data.csv my_table
sqlite> select * from my_table where ...
```

## Links
<https://stackoverflow.com/questions/46407770/how-to-convert-a-json-file-to-an-sqlite-database>
