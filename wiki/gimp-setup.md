---
title: Gimp Setup
date: 2023-01-11T14:42:57+09:00
lastmod:
tags: ['gimp','setup','config']
categories: ['graphic']
---

## UI Font & Icons Size
우분투 환경에서 김프를 실행하면 메뉴와 아이콘 등이 매우 작게 표시되는 경우가 있다. 이를 바로 잡는 방법을 설명한다.

* Change Font Size

자신이 사용하는 OS와 테마에 따라 gtkrc파일이 다를 수 있다. 아래는 ubuntu 22.04, gimp 2.x, Dark 테마의 경우이다. 자신의 환경에 맞게 숫자 값을 적당히 조절한다.

```console
$ sudo vi /usr/share/gimp/2.0/themes/Dark/gtkrc
...
# font_name = "Sans 11"
  font_name = "Sans 10"  # 위 주석 아래에 다음을 추가하고 저장
... 
  
$ gimp &  # 김프 재실행
```

* Change Icons Size

폰트를 먼저 조정이 끝나면 다음으로 아이콘을 수정하는 것이 편리하다. 김프에서 다음의 설정으로 이동한다.
```
Edit> Preference > Interface > Icon Theme > Use Icon size from the theme 선택하고 OK 버튼 클릭
```


## Links
* change icon and font size - <https://superuser.com/questions/1513000/how-to-enlarge-gimp-ui-font-and-icon-size-for-hdpi-screen>
