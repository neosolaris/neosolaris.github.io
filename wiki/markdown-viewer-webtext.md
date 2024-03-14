---
title: Markdown Viewer Webext
date : 2022-08-23T18:35:04+09:00
lastmod:
tags: ["markdown","firefox"]
categories: ["www"]
---

# firefox: markdown viewer 플러그인
- [firefox](firefox)의 플러그인으로 로컬내에서 [마크다운](마크다운)을 html 페이지로 보여준다.
- [vim](vim)과 연동하여 [마크다운](마크다운)파일을 작성하고 실시간으로 볼 때 유용하다.
- Laste Updated: 2022.08.11

## 설치 및 설정

* [firefox](firefox) plugin은 markdown viewer Webext 이다. 이를 설치.

```console
cat <<EOF > ~/.local/share/mime/packages/text-markdown.xml
<?xml version="1.0"?>
<mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
  <mime-type type="text/plain">
    <glob pattern="*.md"/>
    <glob pattern="*.mkd"/>
    <glob pattern="*.mkdn"/>
    <glob pattern="*.mdwn"/>
    <glob pattern="*.mdown"/>
    <glob pattern="*.markdown"/>
  </mime-type>
</mime-info>
EOF

update-mime-database ~/.local/share/mime
```

## 확인 테스트

* 방법1) 브라우저에서 로컬에 있는 md 파일을 불러서 잘 동작하는 지 확인.
	> file:///home/user/markdown/test.md

* 방법2) vim에서 test.md 파일을 작성하고 keymap으로 설정한 firefox 실행.
	- `~/.vimrc` 설정
	```
	"실행키는 <F8>, firefox실행, %는 현재 편집 중인 파일, <CR>은 리턴키
	map <F8> :!firefox % <cr>
	```
	- vim으로 작성 중 `<F8>`로 firefox 실행
	- 주의사항: 작성한 파일 이름에 공백이 있으면 안된다.

## 참고사항

* firefox가 실행중이더라도 위의 update-mime-database 명령으로 바로 적용된다.
* firefox에서 `file:///my_url/markdown_file.md` 파일을 불러오면 멋지게 보인다.* 화면의 좌측 절반은 firefox로 우측 절반은 터미널로 구성하고 vim으로 편집하고 firefox에서 확인한다.
* 이렇게하면 문서의 수정과 확인을 충분히 한다음 [github](github)에 한번만 커밋해서 올릴 수 있다. 시간과 인터넷자원을 절약할 수 있다.


## Reference
* [Markdown Viewer Firefox](https://github.com/KeithLRobertson/markdown-viewer#support-for-local-files-on-linux)


