---
title: Vimwiki Hugo Github.io 연동하기
date: 2022-08-24T00:39:08+09:00
lastmod: 2022-10-06T00:52:29+09:00
tags: ["vimwiki","hugo","papermod","devel"]
categories: ["www","devel"]
---                                                                         
   
## 소개

마크다운 문서를 vimwiki로 작성하여 간단한 메모에서 부터 블로그, 리포트, 기술 문서에 이르기까지 손쉽게 만들 수 있다. 이를 기반으로 하여 깃허브에서 제공하는 무료 웹사이트에 올리는 방법을 설명하고자 한다. 아래는 간략한 개요이다.

* `vimwiki + hugo + github.io` 를 연결하는 프로젝트이다.
* vim의 vimwiki 플러그인을 사용하여 위키문서를 작성한다.
* 위키문서의 작성은 마크다운([markdown](markdown)) 문법으로 한다.
* hugo를 사용하여 임시 로컬웹서버를 띄우고 위키문서를 html로 변환하고 브라우저에서 확인한다.
* 변환된 정적 html 문서를 깃허브에 올린다.
* 깃허브 페이지에서 이를 확인한다.
* UTF-8인코딩이라면 한글도 특별히 문제가 없고 잘 된다. 다만 마크다운 파일명에 공백이 들어가면 관리가 좋지 않으니 `-`등으로 연결해서 쓴다.

## 설치 환경

* OS 및 프로그램 버전
	- os: Ubuntu 22.04 LTS
	- git: 2.34.1
	- vim: 8.2
	- vimwiki 플러그인: 2.5
	- hugo: 0.92.2
	- firefox: 104.0

* `~/data/vimwiki/` : 위키 저장 폴더 (1.위키를 작성하고)
* `~/data/www/` : hugo 웹개발 폴더 (2.웹페이지 생성, 테스트, 개발)
* `~/data/your_idname.github.io/` : 깃허브 로컬 저장소, 웹페이지 위치 (3.결과물을 저장소에 업로드)

## 이 프로젝트의 목적과 방향

* 마크다운 ([markdown](markdown))을 기본 문서 포맷으로 정한 이유
	- ms word나 hwp 등은 해당 프로그램이 있어야하고 linux, unix 에서 사용하기 곤란하다.
	- 언제 어디에서나 작성 가능한 txt 파일이 가장 좋으나 다른 문서로 변환이 곤란하다.
	- 마크다운 문법이 가장 쉬우면서 여러 포맷으로 변환이 가능하다.

* [vimwiki](vimwiki) 를 사용하게 된 이유
	- 깃허브에서 사용되는 마크다운 문법을 지원한다. 
	- 위키이므로 문서를 서로 연결하고 조금씩 개선되는 방식이라 좋다.
	- 일기나 할일 등의 기능을 제공하여 일정 관리가 편하다.
	- vi 또는 [vim](vim)에 익숙한 사용자에게는 가장 좋은 해결책이다.
	- 하나의 위키 또는 여러개의 위키 프로젝트를 만들 수 있다.
	- 설정된 폴더에 위키를 저장하고 깃허브 또는 [dropbox](dropbox) 등에 백업하기 편리하다.
	- vim의 다양한 플러그인과 기능 설정을 활용하여 작업의 자동화, 문서 변환 등을 쉽게 할 수 있다.
	
* [hugo](hugo)를 통해 웹개발과 html 변환
	- 깃허브에서 제공하는 [github io](github.io)는 정적인 html만을 올릴 수 있다.
	- 물론 md(마크다운) 파일을 올려도 볼 수 있지만 hugo와 테마를 이용하면 근사한 개인 블로그를 만들 수 있다.
	- 또한 깃허브에 업로드하면 2-3분 정도 후에야 변경을 확인할 수 있다.
	- 따라서 vimwiki로 만든 파일을 html로 변환하고 로컬에서 테스트할 개발 환경이 필요해진다.
	- 대표적인 것으로 [jekyll](jekyll) 과 [hugo](hugo)가 있다.
	- [jekyll](jekyll)은 [ruby](ruby) 기반으로 설치가 복잡하고 모듈 의존성, 처리 속도 문제 등이 있다.
	- [hugo](hugo)는 [go](go) 기반으로 의존성 문제없이 프로그램 하나만 설치하면 되고 처리 속도도 매우 빠르다.
	- 테마는 [papermod](hugo-papermod)를 사용하기로 했다. 가장 심플하고 안정적이고 깔끔하다.
	- 테마를 적용하면 search, tag, category, archive, 통계, 댓글 등 다양한 기능이 지원된다.

* [github io](github.io)에 블로그 또는 위키페이지를 올리는 이유
	- 홈페이지가 무료이다.
	- `your_idname.github.io`도메인을 기본 제공하고 개인 도메인 설정도 가능하다.
	- 문서의 변경사항 추적 및 복원, 버전관리도 된다.
	- 내 위키 문서에 대한 백업도 편리하게 할 수 있다.

## 기본 설치와 설정 방법
* 본 문서에는 실제로 설치 및 설정을 순서대로 간략하게 흐름을 잃지 않는 선에서 설명하고 각각의 자세한 설명은 아래 문서로 대체한다.
	
	- [github io 페이지 등록 및 설정](github.io)	
	- [vimwiki 설치 및 설정](vimwiki)
	- [hugo 설치 및 설정](hugo)
	- [papermod 테마 설치 및 설정](hugo-papermod)

## Step1. github.io 페이지 등록 및 설정

* `github.com`에 가입하고 새 저장소를 만든다. 
	1. `https://github.com/your_idname` 로 로그인한다. 
	2. 우측 상단 `+` 아이콘을 눌러 `Create a new repository` 클릭.
	3. Repository name은 반드시 자신의 사용자명을 이용해서 만든다.
		> your_idname.github.io
	4. public 선택 > Create repository 로 생성 완료.

* [git](git) 설치 및 설정: 깃허브인증방식은 ssh key 인증을 사용: [github ssh key 인증](github-ssh-key-인증)을 참조

```console
$ sudo apt install git
$ cd ~/data/
$ git config --global user.name your_idname
$ git config --global user.email yourid@gmail.com
$ git clone git@github.com:your_idname/your_idname.github.io.git
$ cd your_idname.github.io.git
$ git remote set-url git@github.com:github.com:your_idname/your_idname.github.io.git

$ echo "<H1> Hello World! </H1>" > index.html
$ git add . && git commit . -m "Upload files" && git push
$ firefox https://your_idname.github.io &
```

## Step2. Vimwiki 설치 및 설정

* vim vim-plug 설치

```console
$ sudo apt install vim
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ vim ~/.vimrc
```

* `~/.vimrc` 설정 파일

```vimrc
call plug#begin()
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
call plug#end()

" vimwiki 설정
" 위키(github.io) 설정
let g:vimwiki_list = [
	\{
	\   'path': '~/data/vimwiki',  "위키문서의 위치
	\   'syntax' : 'markdown',     "마크다운 문법 지정
	\   'ext' : '.md',             "저장 문서 포멧
	\   'diary_rel_path': '.',   
	\}
	\]
" vimwiki의 conceallevel 을 끔
let g:vimwiki_conceallevel = 0
" vimwiki 설정이 markdown의 모든 설정을 제어하지 않게하기
let g:vimwiki_global_ext = 0  
```
* vimwik 플러그인 설치

```console
$ vim +PlugInstall +qall
```

* vimwiki로 테스트 문서 작성: vim 실행후 `\ww` 명령 후 `~/data/vimwiki/index.md` 문서를 시작으로 테스트로 2-3 개의 문서를 작성해 본다.

```console
$ vim
```

## Step3. Hugo 설치 및 설정

* hugo 및 테마 papermod 설치
```console
$ sudo apt install hugo
$ hugo version
$ hugo new site ~/data/www -f yml
$ tree ~/data/www
.
├── themes
├── static
├── layouts
├── data
├── content
├── config.toml
└── archetypes
    └── default.md
	
$ cd ~/data/www
$ git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
```

* 설정 및 테스트
	- 설정파일: `~/data/www/config.yml`
	- 테스트파일: `~/data/www/content/wiki/my-first-post.md`

```console
$ cd ~/data/www
$ echo 'Theme: "PaperMod"' >> config.yml
$ hugo new wiki/my-first-post.md
$ vim wiki/my-first-post.md
```

* html 파일을 임시로 자동생성하고 로컬 웹서버를 띄우기

```console
$ cd ~/data/www
$ hugo -D server
```

* 브라우저에서 확인
`http://127.0.0.1:1313`

* html 파일을 목적지에 생성하기

```console
$ cd ~/data/www    
$ hugo -D          # default: `~/data/www/public`
$ hugo -D -d ~/data/your_idname.github.io  # 깃허브 로컬저장소
```

## Step4. Vimwiki문서를 Hugo에서 처리하여 깃허브에 업로드하기

1. vimwiki 작성시 반드시 frontmatter를 넣어 문서를 작성한다.
```markdown
---
title: 문서1
date: 2022-08-24T16:28:44+09:00 (vim의 strftime이용, iabbr기능이용)
lastmod: 위형식으로 수정한 날짜 입력(vim의 strftime 이용)
tags: ["테그1","테그2"]
categories: ["category1","category2"]
"weight": 1
---                                                                         

## 소제목 1
* 내용 1
* 내용 2

## 소제목 2
* 내용 3
* 내용 4
* [문서2](문서2)
```

1. 작성된 문서(마크다운)들을 링크를 변환하여 hugo 웹개발 폴더에 복사한다.
	- 이 부분이 제일 문제인데 vimwiki 파일 내의 링크 형식 `[문서2](문서2)`가 hugo에서 html변환 시 링크를 잘 못 처리하는 데 있다.
	- 이를 여러 가지로 알아 보았는데 hugo에서는 복잡한 설정으로 사용하기 어렵고 자동화하기도 어렵다. 각 페이지마다 hugo식의 링크방식을 넣어주어야 한다.
	- vimwiki에서 이를 변경할 수 있다해도 vimwiki 본래의 링크 연결이 안되어 문제가 된다.
	- 현재로서는 vimwiki의 모든 md파일을 hugo 웹개발 폴더에 복사하는 중간에 이것을 처리해 주도록 하면 된다.
	- 즉, `[문서2](문서2)` 부분을 `[문서2](../문서2)`로 바꾸어 준다.
	- 그 이유는 html 결과물이 `BASE_URL/문서1/index.html` 이런 폴더 형식으로 바뀌기 때문에 hugo프로젝트에 들어온 마크다운의 링크 입장에서는 상위로 가서 `문서2` 폴더로 이동해야 하기 때문이다.

2. 파일 내 링크 변환

`~/data/vimwiki/*.md  -->  파일 내 링크 변환 -->  ~/data/www/content/wiki/`

* 이를 처리하는 스크립트를 작성 (핵심만 표현)

```bash
#!/usr/bin/env bash
# prog_name: blogen.sh
src="~/data/vimwiki"
dst="~/data/www/content/wiki
for file in ${src}/*.md
do
    # 기본 파일 이름을 구함
    base_name=$(basename $file)
    # 넘어온 파일 중에 index.md는 파일이름을 바꿈: hugo에서 문제 발생
    if [ "$base_name" == "index.md" ];then
        base_name="wiki-index.md"
    # 파일 내에 있는 링크를 모두 수정해서 hugo 개발폴더에 넣어준다.
    # 아래 필터링은 마크다운의 인용구에 대해서도 링크를 처리하는 문제점이 있다.
    # 추후 정교하게 다시 만들 필요가 있다.
    cat $file | \
    sed -e 's|](|](../|g' -e 's|](../http|](http|g' \
    > ${dst}/${basename}
done
```

* 수정사항 - 위 코드의 문제점 때문에 쉘스크립트를 파일로 부터 한 줄씩 넘기면서 처리토록 하였다. 한 줄에 하나 이상의 링크일 경우, 외부 링크일 경우, 단어 인용, 구문인용 등을 식별하여 모두 처리하도록 하였다. 그러나 grep이나 sed 등을 모든 경우에 사용하다보니 속도가 많이 느려졌다. 이를 개선하기 위해 [lua](lua)를 공부하여 만들었는데 매우 빠른 처리가 가능했다. 그리고 더욱 처리 성능을 높인 것은 변경된 또는 새로 추가된 파일만 식별해서 처리하도록 한 것이다. 기본 아이디어는 스크립트를 실행시 시간을 자동 저장하고, 다음 처리 때 이 시간과 파일의 mtime을 비교하는 것이다. 이 스크립트는 며칠 공부하고 만든 것이라 많이 부족하지만 혹시 참고가 될까 하여 링크를 걸어 두었다. 이를 vim에서 단축키 실행 등록을 해두면 편하다. 글에만 집중할 수 있게 된다.
	<https://github.com/neosolaris/neosolaris.github.io/blob/main/www/blogen-0.1.lua>

3. 로컬 웹서버를 띄우고 브라우저에서 오류나 문제점들을 확인한다.

```
$ hugo -D server
```

4. 웹페이지를 로컬저장소에 만들고, github 저장소로 업데이트 한다.
```console
$ cd ~/data/www
$ hugo -D -d ~/data/your_idname.github.io
$ cd ~/data/your_idname.github.io
$ git add . && git commit . -m "update files" && git push
```

5. 브라우저에서 확인한다. (업데이트 이후 변경을 확인하는데 2-5분 소요)

## Step5. 자동화 하기

* vimwiki에서 작성한 문서를 vimwki2html이라는 기능으로 변환이 가능하나 이는 hugo 스타일과 맞지 않기 때문에 위의 `blogen.sh`를 수행하도록 한다.
	- `bolgen.sh {gen|push|all}`로 기능을 확장시키고 이를 상황에 따라 실행한다.
	- `blogen.sh gen` - vimwiki에서 hugo로 옮길 때 링크변환 및 html 생성하기
	- `blogen.sh push` - github에 올리기
	- `blogen.sh all` - 위 두 과정 모두 실행

* vimwiki에서 문서 작업 완료 후 실행하기 - vim lastline mode 
	- 물론 `blogen.sh`가 PATH에 설정되어 있어야 한다.
  
```console
:! blogen.sh {gen|push|all}
```

##  참고 사항

* vimwik의 기준이 되는 문서 `index.md` 파일은 hugo에서의 충돌로 wiki-index.md로 바꿔주어야 한다.
* hugo에서는 가장 최신의 문서가 블로그 홈화면의 최상위로 뜨며 다섯개가 기본.
* 우선 순위는 `frontmatter`에서 `weight=1` 식으로 줄 수 있다. 1이 최상.
* `~/data/www`도 어차피 개발 폴더이기 때문에 `~/data/your_idname.github.io/www`로 포함시키고 깃허브에서 통합해서 관리하는 것도 좋겠다.
* 이 경우 분리된 상태로 먼저 작업했다가 페이지가 안정적으로 동작하고 난 후에 개발폴더를 옮겨 준다. 이에 따라 변경된 폴더들을 `blogen.sh`에도 잘 반영해야한다.
* 기본 15 페이지 기준으로 `~/data/www`는 약 1.2Mb 정도이다.
* 이제 웹개발 환경이 구축되었으므로 블로그를 본격적으로 꾸며간다.
* 이것은 테마 papermod를 사용하였으므로 [papermod 설치 및 설정](hugo-papermod)을 참고한다.

## TODO

* [X] 2022.10.06: 오타 수정, shell 명령어 인용코드 정리
* [X] 2022.09.12: vimwiki에서 파일명과 링크를 수정했을 때 hugo에서 과거 파일이 남는 문제
  * [X] 처리 프로그램 `blogen.lua`에 양쪽의 파일을 조사하여 동기화 처리
 
## Links

* <https://cristianpb.github.io/blog/vimwiki-hugo>
* <https://gohugo.io/getting-started/quick-start/>
* <https://themes.gohugo.io/themes/hugo-papermod/>

