---
title: Openresty - Scalable Web Platform NGINX with Lua
date: 2023-09-16T16:50:04+09:00
lastmod: 2023-09-27T18:06:49+09:00
tags: ['openresty', 'web', 'programming','nginx','lua']
categories: ['www']
---

## INTRO
* openresty는 nginx와 lua 기반의 웹개발 플랫폼이다.
* [lua](lua)는 [luajit](luajit) 을 사용하고 엔진이 포함되어 있다.
* 서버에서 동작한다.
* 대부분의 리눅스 배포판은 패키지를 지원한다.
* 여기에서는 [docker](docker) 이미지로 설치하고 사용하는 방법을 정리한다.
* System Info: RaspberryPi 3 Model B Rev 1.2
* OS: Raspbian (Debian 11, Bullseye)
* Docker: version 24.0.5

## Getting Started
* Hello World
```
# Install Docker and Relogin after exit

curl -sSL https://get.docker.com | sh
sudo usermod -aG docker $usermod
exit
...
docker run hello-world

# Docker Image get
docker pull openresty/openresty:alpine

# Setup
mkdir ~/www
cd ~/www
mkdir conf html
vi conf/nginx.conf
...
worker_processes 1;
error_log error.log;
events {
    worker_connections 1024;
}
http {
    server {
        listen 8000;
        location / {
            default_type text/html;
            content_by_lua '
                ngx.say("<p>hello world!</p>")
            ';
        }
    }
}
...

# Run openresty docker image
docker run --name mresty --rm --volume `pwd`/conf/:/usr/local/openresty/nginx/conf/ \
    -p 127.0.0.1:8000:8000 openresty/openresty:alpine

# docker process check
docker ps

# openresty web server test
curl localhost:8000
<p>hello world!</p>
```

## Openresty Comandline Utility

```
# version check
resty -v

# Hello World
resty -e 'print("Hello World")'
echo 'print("Hello World")' > hello.lua
resty hello.lua

# resty ngx module test
time resty -e 'gnx.sleep(1) ngx.say("done")'
resty -e 'local sock = ngx.socket.tcp() print(socke:connect("openresty.com",443))'
resty -e 'ngx.thread.wait(ngx.thread.spawn(function () print("in thread!") end))'

mkdir lua/
vim lua/test.lua
...
local _M = {}
function _M.hello() print("Hello") end
return _M
...
resty -e 'require "test".hello()'  # Error
resty -I lua/ -e 'require "test".hello()'  # Hello

resty -e 'local ok, stdout = require "resty.shell".run([[echo ok]]) print(stdout)' # ok
resty --shdict 'dogs 10m' -e 'print(ngx.shared.dogs:set("age",11))' # truenilfalse
resty --shdict 'dogs 7m' --shdict 'cats 5m' -e 'print(ngx.shared.dogs, " ", ngx.shared.cats)' 

resty --http-conf 'lua_regex_match_limit 102400;' -e 'print "ok"'

# Bench Test
echo 'local a = 0 for 1, 1e8 do a = a+1 end print(a)' > bench.lua
time resty -joff bench.lua  # without Jit Compiler
time resty bench.lua        # with Jit Compiler (Fast)
resty -jv bench.lua
resty -jdump bench.lua | less

# Help
resty -h | less  # See Help
restydoc resty-cli  # See Document
```

## Structure and Lua Module

* Create Project Folder and Modules
```
mkdir test-module
cd test-module
mkdir logs conf lua

vim lua/hello.lua
...
local _M = {}
function _M.greet(name)
    ngx.say("Greetings from ", name)
end
return _M
...
```

* Setup nginx.conf
```
vim conf/nginx.conf
...
worker_processes 1;
events {
    worker_connections 1024;
}
http {
    # Lua module Preload for performance and Cache
    init_by_lua_block {
        require "hello"
    }
    # add module path to lua package path: $prefix means nginx -p option value
    lua_package_path "$prefix/lua/?.lua;;"
    # Server Setup: port, lua block...
    server {
        listen 8080 reuseport;
        location / {
        content_by_lua_block {
            local hello = require "hello"
            hello.greet("a Lua module")
            }
        }
    }
}
...
```

* Server start and Test
```
# server configuration test
nginx -p $PWD/ -t 

# server start
nginx -p $PWD/

# Chech Error Log
tail logs/error.log 

# client request test : Browser also available
curl 'http://127.0.0.1:8080'
Greetins from a Lua module
```

* Server Admin
```
# check server process
ps aux | grep nginx | grep -v /tmp/
pgrep -l nginx

# Edit nginx.conf
vim conf/nginx.conf

# Server Restart (After editting of nginx.conf)
kill -HUP `cat logs/nginx.pid`

# client request again
curl 'http://127.0.0.1:8080'
```

## Build Develop Environment
* Makefile을 만들고 도커이미지를 제어하고 로그 등을 확인할 수 있는 환경을 만든다.
* `Makefile`
* `conf/nginx.conf`
* Test

## REFERENCE
* awesome-resty - https://github.com/bungle/awesome-resty
* Docker
    - RaspberryPi Docker - https://pimylifeup.com/raspberry-pi-docker/

* Openresty
    - Openresty - https://openresty.org
    - Openresty Getting Started - https://openresty.org/en/getting-started.html
    - Openresty Linux Package List - https://openresty.org/en/linux-packages.html
    - Openresty FAQs - https://openresty.org/en/faq.html
    - Openresty Resources - https://openresty.org/en/resources.html
    - Openresty Directives - https://openresty-reference.readthedocs.io/en/latest/Directives/
    - Openresty API - https://openresty-reference.readthedocs.io/en/latest/Lua_Nginx_API/
    - An-Introduction-To-OpenResty-Nginx-Lua - https://www.openmymind.net/An-Introduction-To-OpenResty-Nginx-Lua/
