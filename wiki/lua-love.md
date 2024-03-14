---
title: Love - 루아 2D 게임 프로그래밍
date: 2022-09-15T00:09:14+09:00
lastmod: 2023-01-26T12:33:20+09:00
tags: ["lua","love","game"]
categories: ["programming"]
---

## Intro

* love는 lua에서 사용할 수 있는 2D 게임 프레임워크이다.
* 게임을 만들려는 것은 아니고 2D 그래픽 응용 프로그램을 모색하기 위함.
* 작은 모의 실험이나 시뮬레이션용으로 사용이 가능하다.
* 역시 작고 가볍고 빠르다.

## Install

* debian/ubuntu package install
```console
$ sudo apt install love  # 패키지 설치
$ love --version         # check version
```

* ubuntu ppa install: 최신버전으로 설치
```console
$ sudo add-apt-repository ppa:bartbes/love-stable
$ sudo apt update
$ sudo apt install love
$ love --version
```

## Hello World

```console
$ mkdir ~/love-test     # make dir for love application
$ cd ~/love-test        # goto dir

$ cat <<EOF > main.lua   # edit main.lua source file
function love.draw()
  love.graphics.print("Hello World", 400, 300)
end
EOF

$ love .      # love <path> : 실행
OR
$ love ~/love-test   # 프로젝트 폴더명
```

## vim nvim 지원 플러그인
* sumneko lua-language-server 를 설치하고 설정해 주면 된다.
* vim 또는 nvim에서 기본 설정으로 했을 경우 love2d 3rd 확장으로 지원됨.
* 그러나 메모리 및 CPU 로드가 엄청나다. 정교한 설정이 필요하다.

* 사용하기에 부족하지만 부가적으로 참고
  * love-api <https://github.com/love2d-community/love-api>
  * vim-love-docs <https://github.com/davisdude/vim-love-docs>
  * syntax highlighting, help 등을 지원한다고 나와있다.

## Atom 지원 플러그인
* `atom` IDE 에서 `love-2d` api 플러그인이 지원된다.
* 그러나 atom이 2022년 12월에 플러그인 및 업데이트 지원이 종료된다.
* 편리하게 사용하려면 vscode를 사용한다. 아래 섹션 참고.

## Vscode 지원 플러그인

* pixelbyte-love2d 를 검색하여 플러그인 설치.
* 폴더명/main.lua 소스를 만들고 코딩하면 자동완성 및 API 참조 등이 가능.
* 'Alt` + `l` 단축키를 누르면 소스에서 실행된다.
* 또는 터미널에서 `$ love .`으로 실행한다.

## 한글 관련

* love.graphics.print 한국어 출력
  - 프로젝트 폴더 내에 아래 폰트파일(gulim.ttc)이 존재해야 한다.
  - 프로젝트 외부의 폴더를 절대경로 또는 상대 경로로 적용할 수 없다.
  - 반드시 프로젝트 폴더 내에서는 상대 경로를 사용할 수 있다.
  - 이유는 플랫폼 독립적으로 프로젝트가 실행되어야 하기 때문이다.

```lua
function love.load()
korfont = love.graphics.newFont("gulim.ttc")
end

function love.draw()
    love.graphics.setFont(korfont)
    love.graphics.print('안녕하세요!', 400, 300)
end
```

## Config Files
* Setup Howto
```console
$ vi love2d_project/conf.lua  # 설정하기
...
function love.conf(t)
  t.window.width = 1024
  t.window.height = 768
  t.window.resizable = false
  t.modules.joystick = false
end
...
$ love love2d_project         # 적용확인
```

* `conf.lua` default
```
function love.conf(t)
  t.identity = nil                   -- 세이브 디렉토리의 이름 (string)
  t.version = "0.9.1"                -- 게임에서 사용한 LÖVE의 버전 (string)
  t.console = false                  -- 옆에 콘솔을 띄움 (boolean, 윈도우즈 전용)

  t.window.title = "Untitled"        -- 게임의 창 제목 (string)
  t.window.icon = nil                -- 윈도우 아이콘으로 사용할 이미지 파일의 경로 (string)
  t.window.width = 800               -- 윈도우 너비 (number)
  t.window.height = 600              -- 윈도우 높이 (number)
  t.window.borderless = false        -- 윈도우의 테두리 없애기 (boolean)
  t.window.resizable = false         -- 사용자가 윈도우 크기를 변경 가능 (boolean)
  t.window.minwidth = 1              -- 사용자가 윈도우 크기를 변경 가능할 때 최소 너비 (number)
  t.window.minheight = 1             -- 사용자가 윈도우 크기를 변경 가능할 때 최소 높이 (number)
  t.window.fullscreen = false        -- 전체 화면 활성화 (boolean)
  t.window.fullscreentype = "normal" -- 전체 화면 모드의 종류 (string). http://www.love2d.org/wiki/FullscreenType_(한국어) 참조
  t.window.vsync = true              -- 수직 싱크 활성화 (boolean)
  t.window.fsaa = 0                  -- FSAA 버퍼의 수 (number)
  t.window.display = 1               -- 듀얼 모니터 환경에서, 창을 띄울 모니터 번호 (number)
  t.window.highdpi = false           -- 레티나 디스플레이에서의 고해상도 모드 (boolean). 0.9.1에서 추가됨.
  t.window.srgb = false              -- sRGB 활성화 (boolean). 0.9.1에서 추가됨.

  t.modules.audio = true             -- 오디오 모듈 활성화 (boolean)
  t.modules.event = true             -- 이벤트 모듈 활성화 (boolean)
  t.modules.graphics = true          -- 그래픽 모듈 활성화 (boolean)
  t.modules.image = true             -- 이미지 모듈 활성화 (boolean)
  t.modules.joystick = true          -- 조이스틱 모듈 활성화 (boolean)
  t.modules.keyboard = true          -- 키보드 모듈 활성화 (boolean)
  t.modules.math = true              -- 수학 모듈 활성화 (boolean)
  t.modules.mouse = true             -- 마우스 모듈 활성화 (boolean)
  t.modules.physics = true           -- 물리 모듈 활성화 (boolean)
  t.modules.sound = true             -- 사운드 모듈 활성화 (boolean)
  t.modules.system = true            -- 시스템 모듈 활성화 (boolean)
  t.modules.timer = true             -- 타이머 모듈 활성화 (boolean)
  t.modules.window = true            -- 윈도우 모듈 활성화 (boolean)
  t.modules.thread = true            -- 스레드 모듈 활성화 (boolean)
end
```

## 패키징 및 배포하기

* 최종 테스트를 한 후에 `conf.lua`로 필요한 설정을 한다.
* zip으로 압축하고 테스트한 후 배포.

```console
$ cd shooting-game
$ ls
bullet.lua  classic.lua  conf.lua  enemy.lua  images  main.lua  player.lua
$ vi conf.lua
function love.conf(t)
  t.window.width = 1024
  t.window.height = 768
  t.window.resizable = false
  t.window.joystick = false
  t.window.title = "Panda Shooter 판다 슈터"
  t.window.icon = "images/panda.png"
end

$ zip -9 -r ../test.love .       # 압축하기
$ cd ../
$ love shooting-game.love        # 실행 테스트
$ mv shooting-game.love shooting-game.zip  # 확장자변경(옵션)
$ love shooting-game.zip
```

## Links
아래 관련 문서들을 참고하여 시작한다.

* 한글 입문서 <https://digiconfactory.tistory.com/entry/%EB%A3%A8%EC%95%84Lua-%EA%B2%8C%EC%9E%84%EB%A7%8C%EB%93%A4%EA%B8%B0-Love-%EA%B2%8C%EC%9E%84%EC%97%94%EC%A7%84-%EC%9C%88%EB%8F%84%EC%9A%B010?category=952012>
* love home <https://love2d.org/>
* love github <https://github.com/love2d/love>
* love wiki <https://love2d.org/wiki/Main_Page>
* love config <https://love2d.org/wiki/Config_Files>
* tutorials <https://love2d.org/wiki/Category:Tutorials>
* awesome-love2d <https://github.com/love2d-community/awesome-love2d>
