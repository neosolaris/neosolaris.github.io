---
title: Hugo - Fast and flexible Static Site Generator written in Go
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-09-08T15:00:45+09:00
tags: ["hugo","www","github.io", "devel","vimwiki","markdown"]
categories: ["www","devel"]
---

- 2022.09.08 - 링크 수정, 오타 수정

## Install

* [ubuntu](ubuntu) 에서 패키지로 설치

```console
$ sudo apt install hugo
$ hugo version
```

## Create a New SIte

```console
$ hugo new site my_site -f yml
```

## Add a Theme

* 설치와 설정에 대한 자세한 사항은 [hugo papermod](hugo-papermod)를 참고.

* PaperMod 테마 설치
```console
$ cd my_site
$ git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
```

* Update
```console
$ cd themes/PaperMod
$ git pull
```

* Add theme set in `config.yml`
  
```console
$ echo 'theme: "PaperMod"' >> config.yml
```

* 또는 [PaperMod](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation) 홈에 가서 config.yml을 복사한다. 


## Sample Page 만들기

```markdown
---
title: "My 1st post"
date: 2020-09-15T11:30:03+00:00
# weight: 1
# aliases: ["/first"]
tags: ["first"]
author: "Me"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
description: "Desc Text."
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
	image: "<image path/url>" # image path/url
	alt: "<alt text>" # alt text
	caption: "<text>" # display caption under cover
	relative: false # when using page bundles set this to true
	hidden: true # only hide on current single page
editPost:
	URL: "https://github.com/<path_to_repo>/content"
	Text: "Suggest Changes" # edit text
	appendFilePath: true # to append file path to Edit link
---
## This is sample Page

Hello World!
```

* 페이지 생성1: `my_site/contents/sample.md`가 들어간다.

```console
$ hugo new --kind post sample.md
```

* 페이지 생성2: `my_site/contents/posts/my-first-post.md`가 생성된다.

```console
$ hugo new posts/my-first-post.md
```

## LANGUAGE CODE 설정

* `my_site/langcode.yaml` 을 추가하고 설정한다.

```yaml
- id: prev_page
  translation: "Prev"

- id: next_page
  translation: "Next"

- id: read_time
  translation:
    one: "1 min"
    other: "{{ .Count }} min"

- id: words
  translation:
    one: "word"
    other: "{{ .Count }} words"

- id: toc
  translation: "Table of Contents"

- id: translations
  translation: "Translations"

- id: home
  translation: "Home"

- id: edit_post
  translation: "Edit"

- id: code_copy
  translation: "copy"

- id: code_copied
  translation: "copied!"
```

## Start the Hugo Server

* 아래와 같이 서버를 실행하고 브라우저에서 `http://localhost:1313` 으로 확인
* 실행 위치는 `my_site/` 내에서 해야한다.

```console
$ hugo server -D
```

## Links

* <https://cristianpb.github.io/blog/vimwiki-hugo>
* <https://gohugo.io/getting-started/quick-start/>
* <https://themes.gohugo.io/themes/hugo-papermod/>
