---
title: Lua - Interactive Mode
date: 2022-09-22T15:08:09+09:00
lastmod: 2023-08-11T17:38:11+09:00
tags: ['lua','luajit','interactive','rlwrap','cli','readline']
categories: ['programming','lua']
---

* [X] 2023-08-11: rlwarp + readline을 활용한 키워드 완성 기능 추가

## Intro
* 코딩을 하기 전 또는 빠른 확인을 위해 인터엑티브 모드를 사용
* 간단한 테스트나 몇가지 실험을 해보는 용도로서 좋다.
* `ilua`를 사용하면 jupyter console, notebook 등으로 확장할 수 있다.

## Execute String

```console
$ lua -e 'print("hello world")'
hello world
```

## Interactive Mode

* `lua -i` 또는 `luajit -i` 로 interactive mode로 진입
* `-i` 옵션이 없어도 진입 가능
* local 변수가 다음 라인에서 인식되지 않는다. 사용할 때 주의

```cosole
$ lua -i                   -- 또는 luajit -i
> local a = 'hello world'  -- local 변수 설정
> print(a)                 -- print
nil                        -- 결과: nil

> a = 'hello world'        -- Global 변수 설정
> print(a)                 -- print
hello world                -- 결과: hello world

> os.exit()                -- 종료: 또는 Ctrl+d, Ctrl+c
```

* Opening Lua File
```console
> f = assert(loadfile('foo.lua')  -- lua파일 로드
> f()                             -- 실행

> dofile('foo.lua')               -- 로드 및 실행

> m = require('mymodule')         -- mymodule.lua 모듈 로드
> m.parse()                       -- 모듈내 함수 실행
```

* Load Libary Example

```lua
-- file 'lib1.lua'
function norm(x,y)
  local n2 = x^2 + y^2
  return math.sqrt(n2)
end

function twice(x)
  return 2*x
end
```
```console
> dofile('lib1.lua')     -- load your library
> n = norm(3.4, 1.0)     -- using lib1.lua functions
> print(twice(n))        -- using twice functions
```

* Command Line Arguments (`-- /dev/null` 옵션 주목)
```console
$ lua -i -- /dev/null one two three
> print(arg[1]) -- one
> print(arg[2]) -- two
> print(arg[3]) -- three
> print(arg[0]) -- /dev/null
```

## Lua, LuaJit line completion like in bash

* bash에서 line completion과 유사한 기능을 구현
* rlwrap 활용 - `-a:always-readline`,`-c:complete-filenames`,`-e:extra-char-after-completion`
```console
$ sudo apt install rlwrap
$ alias luajit='rlwrap -ac -e "" -pRed luajit'  # add this line to ~/.bashrc
$ luajit
> = 2 + 2
4
> = 2 + 2  --> 화살키를 이용하여 상위 명령라인을 불러 올 수 있다.
```
* rlwarp의 readline을 활용한 명령어 완성: Dictionary 파일을 만들고 사용.
```console
$ echo "print local assert string ..." > ~/.luadict
$ alias luajit='rlwrap -b "" -f $HOME/.luadic -pRed -ca -e "" luajit'
$ luajit
> ass(-> Press Tab Key anc Check)
```

## iLua : with Jupyter

* Jupyter의 막강한 지원아래 콘솔형 인터엑티브를 사용할 수 있다.
* 코드완성 및 vi edit mode 그리고 변수를 직접 출력가능하다.
* 물론 특성상 local 변수는 역시 지원되지 않는다. 현재로서는 그렇다.
* `~/.local` 이하에 jupyter 및 ilua가 설치된다.
* 아래처럼 `vi edit mode`를 사용하면 더욱 편리하다.

```console
$ pip install ilua
$ echo "c.ZMQTerminalInteractiveShell.editing_mode='vi'" > ~/.jupyter/jupyter_console_config.py
$ jupyter console -h             # help
$ jupyter kernelspec list        # 내장 커널 스펙 확인
$ ~/.local/bin/ilua -i lua[jit]  # 실행

$ echo "alias ilua='ilua -i luajit'" >> ~/.bashrc  # luajit 전용 alias
$ source ~/.bashrc
$ ilua
```

## Links
* <https://www.lua.org/pil/1.1.html>
* <https://www.tutorialspoint.com/command-line-arguments-in-lua>
* <https://lua-users.org/wiki/InteractiveLua>
* <https://github.com/guysv/ilua>
* <https://jupyter-console.readthedocs.io/en/latest/config_options.html>
