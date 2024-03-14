---
title: PaperMod - Hugo Theme
date: 2022-08-24T17:43:38+09:00
lastmod: 2022-09-08T14:57:29+09:00
tags: ["hugo","papermod","www","theme"]
categories: ["www","devel"]
---                                                                         
## TODO

* [ ] 아이콘 표시 및 구조 파악해서 이를 적용하기
* [X] 2022-09-08 - 내용 수정, 그림파일 링크 관련 추가

![Papermod Screen Shot](../images/papermod.png)

## Intro

* hugo의 테마 중에 가장 간결하고 안정적이며 많은 사람들이 사용하고 있다.
* hugo 프로젝트는 `~/www`로 가정한다.
* 주의할 것은 hugo의 구조가 `~/www/contents/`이하에 markdown 파일을 넣어주어야 하고, 이하 폴더는 적절히 만들되 `index.md`파일은 만들면 웹페이지 메인 화면에 내용이 뜨질 않는다는 점이다.
* 설정은 `~/www/config.yml`이다.
* 설정을 변경하면 `hugo -D server` 동작시 자동으로 반영된다.
* 만약 설정 변경 사항이 브라우저에서 보이지 않으면 서버를 재실행 한다.

## Install and Update

* Install
```console
$ cd ~/www
$ git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
```

* Update
```console
$ cd themes/PaperMod
$ git pull
```

## Setup 관련 링크

* 아래 사이트에 `config.yml` 및 `post.md` 샘플이 있으니 참고한다.
* <https://adityatelange.github.io/hugo-PaperMod/posts/papermod/papermod-installation/>

## 테마 설정

* papermod 의 테마는 light/dark/auto 가 있다.
* 홈화면 좌측 상단에 해/달 아이콘 클릭
```yml
baseURL: "https://your_idname.github.io/" # 자신의 깃페이지 URL
title: My Blog and wiki # 블로그홈 제목
paginate: 5             # 홈에서 보여줄 블로그 표시 갯수
theme: "PaperMod"       # 테마 PaperMod로 지정

params:
    # defaultTheme: light
    # defaultTheme: light
    defaultTheme: auto    # auto로 설정하면 사용자가 바꿀 수 있다.
    
    # disableThemeToggle: true  # 해/달 아이콘을 보이지 않게 하기
```

## 메뉴설정

* 홈 우측 상단 메뉴를 다음과 같이 추가한다.
```yml
menu:
  main:
    - identifier: categories    # 블로그 카테고리 메뉴
      name: categories
      url: /categories/
      weight: 10
    - identifier: search        # 블로그 검색 메뉴
      name: Search
      url: /search
      weight: 30
    - identifier: tags          # 블로그 태그 메뉴
      name: tags
      url: /tags/
      weight: 20
    - identifier: archives          # 블로그 태그 메뉴
      name: tags
      url: /tags/
      weight: 20
``` 
      
* Archive Page - 아카이브 페이지, 날짜별로 올린 포스트문서가 정리됨
```console
$ cat << EOF > ~/www/content/archives.md
---
title: "Archive"
layout: "archives"
# url: "/archives"
summary: "archives"
---
EOF
```

* Search Page - 검색페이지, 퍼지 스타일의 빠른 검색
```console
$ cat << EOF > ~/www/content/search.md
---
title: "Search" # in any language you want
layout: "search" # is necessary
# url: "/archive"
# description: "Description for Search"
summary: "search"
placeholder: "검색어를 입력하세요"
---
EOF
```

* tags와 categories는 올릴 포스트문서 `post.md` 등의 frontmatter에 기록하면 자동으로 분류되고 홈 상단 메뉴에서 볼 수 있다.

## Post Cover Image

* `~/www/config.yml`에 설정해주고 아래 설명대로 포스트문서에 링크를 걸어주면 된다.
```yml
cover:
  image: "<image path/url>"
  # can also paste direct link from external site
  # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
  alt: "<alt text>"
  caption: "<text>"
  relative: false # To use relative path for cover image, used in hugo Page-bundles
```

* 이미지 사이즈를 줄이고 처리속도를 높이려면 아래 설정 추가
```yml
params:
  cover:
    responsiveImages: false
```    

* 그러나 실제로 적용해도 페이지는 변화하지 않는다.
* 다음 방법으로 해결하였는데 위 방법이 해결되면 다시 정리 예정.
* 그리고 자신의 github에서 wiki를 클릭하여 이미지를 넣어 링크를 받아오는
  방법이 있는데 이는 너무 번거롭고 링크주소가 복잡하여 하지 않았다.

* 현재 해결된 방법은 다음과 같다.
```console
$ mkdir ~/www/contents/images  # hugo 프로젝트 폴더의 contents/images 생성
$ cp myimage.png ~/www/contents/images/  # 내 그림파일 복사
$ vim ~/www/contents/wiki/my-new-post.md   # 새로운 포스트 작성
...
![Post Image](../images/myimage.png)   
...
$ hugo -D server  # 브라우저에서 이미지 로딩 확인
```

* 아직 홈페이지 화면 이미지는 복잡한 구조를 이해하지 못해 올리지 못하고 있다.

## Show TOC (Table of Contents)

* 모든 블로그에 목차를 보이게 하려면 아래 설정 추가
```yml
ShowToc: true
TocOpen: true
```

* 각 페이지에 선택적으로 목차를 만들 경우에는 해당 페이지에 설정한다.
```markdown
---
생략...
ShowToc: true
TocOpen: true
---
```

## Tips

* lastmod 를 사용하여 문서의 최종 업데이트 날짜를 블로그에 표시하기
```console
$ mkdir -p ~/www/layouts/partials
$ cat <<EOF > ~/www/layouts/partials/post_meta.html
{{ $date := .Date.Format "02.01.2006" }}
{{ $lastmod := .Lastmod.Format "02.01.2006" }}

{{- $scratch := newScratch }}

{{- if not .Date.IsZero -}}
{{- $scratch.Add "meta" (slice (printf "<span title='%s'>%s</span>" (.Date) (.Date | time.Format (default "January 2, 2006" site.Params.DateFormat)))) }}
{{- end }}

{{- if ne $lastmod $date -}}
{{- $scratch.Add "meta" (slice (printf "<span title='%s'>(updated %s)</span>" (.Lastmod) (.Lastmod | time.Format (default "January 2, 2006" site.Params.DateFormat)))) }}
{{- end }}

{{- if (.Param "ShowReadingTime") -}}
{{- $scratch.Add "meta" (slice (i18n "read_time" .ReadingTime | default (printf "%d min" .ReadingTime))) }}
{{- end }}

{{- if (.Param "ShowWordCount") -}}
{{- $scratch.Add "meta" (slice (i18n "words" .WordCount | default (printf "%d words" .WordCount))) }}
{{- end }}

{{- with (partial "author.html" .) }}
{{- $scratch.Add "meta" (slice .) }}
{{- end }}

{{- with ($scratch.Get "meta") }}
{{- delimit . "&nbsp;·&nbsp;" -}}
{{- end -}}
EOF

$ vim ~/www/contents/mypost.md   # 내 문서의 frontmatter에 lastmod 추가
---
...
lastmod: 2022-09-08T17:49:01+09:00
---

$ hugo -D server  # 브라우저에서 확인
```

* [vimwiki](vimwiki)의 index.md 처리: `blog.lua`에서 자동으로 처리
```console
$ cd ~/data/www/contents/wiki/
$ mv index.md wiki-index.md
```

## Links

* <https://themes.gohugo.io/themes/hugo-papermod/>
* <https://github.com/adityatelange/hugo-PaperMod>
* <https://github.com/adityatelange/hugo-PaperMod/wiki/Installation>
* <https://github.com/adityatelange/hugo-PaperMod/wiki/Features>
* <https://github.com/adityatelange/hugo-PaperMod/wiki/FAQs>

