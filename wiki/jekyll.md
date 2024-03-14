---
title: Jekyll
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-24T02:14:38+09:00 
tags: ["jekyll","www", "devel"]
categories: ["www"]
---

## 소개

* 깃허브에서 제공하는 깃페이지 [github io](github.io)에 웹 블로그 환경을 만들 수 있는 프로젝트이다.
* 현재 나는 [hugo](hugo)로 전환하였다.
* 이 문서는 더 이상 업데이트 되지 않을 것이다.
* 혹시 이 문서를 보는 분을 위하여 가장 잘 설명해 놓은 곳을 소개한다.
	- <https://devinlife.com/howto/>

## Install

```console
sudo apt update
sudo apt install ruby ruby-dev

cat>>EOF >> ~/.bashrc
# Ruby exports
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
EOF

source ~/.bashrc
gem install jekyll bundler
```

## 개발 사이트 만들기

* 프로젝트 생성 후 서버 시작

```console
jekyll new www
cd www/
bundle exec jekyll serve 
```

* jekyll 서버 실행 에러시
```console
cd www/
echo 'gem "webrick"' >> Gemfile
bundle install
bundle exec jekyll serve --host 127.0.0.1 --port 4000
```

* 브라우저에서 다음 URL로 확인
```
http://127.0.0.1:4000
```

* 폴더 내의 변경은 자동 업데이트된다.
* 그러나 `_config.yml`의 경우는 `jekyll serve`를 재실행 해주어야 한다.

## 테마 프로젝트 설치

* [minimal mistakes](minimal-mistakes)


## Links
* <https://devinlife.com/howto>
* [Jekill 홈페이지](https://jekyllrb.com/)
