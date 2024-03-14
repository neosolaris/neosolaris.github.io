---
title: nvim-scp - nvim으로 원격 파일 편집
date: 2023-09-07T11:49:57+09:00
lastmod: 2023-09-08T14:32:57+09:00
tags: ['nvim','scp','ssh','remote']
categories: ['editor']
---

## Intro
* 원격지에 직접 로그인해서 편집할 경우 그 곳의 vim 또는 nvim 을 설치, 설정을 해주어야 편하게 쓸 수 있다.
* 간단히 수정하는 정도면 기본적인 vi 정도가 있으므로 그것으로 해결하면 된다.
* 그러나 좀 더 자세한 수정 또는 코딩을 하는 경우에는 불편하다.
* 로컬에서 자신이 설정해 놓은 (n)vim으로 원격지 파일을 수정하는 간단하고 쉬운 방법이다.
* 조사한 결과 여러가지 방법이 많은데 scp를 이용하여 복잡하지 않고 간단하게 쓰기 좋다.
* 그 밖의 방법으로 nvim server/client mode를 이용하는 방법, rsync, tmux, distant.nvim 등이 있다.

## Howto
* 먼저 로컬에 ssh, scp 등이 설치되어 있어야 한다.
* 당연히 로컬에 자신의 환경에 맞게 설치 설정된 (n)vim도 있어야 한다.
* 원격지에 ssh로 접속할 수 있는 환경도 필요하다.
* ssh원격로그인을 키인증으로 해 놓으면 더욱 편리하다. (ssh-keygen으로 생성, local:id_rsa.pub -> remmote:authorized_keys 추가)

```console
$ vim scp://user@server-name[:port]//path-to-file.txt
```

또는 (n)vim에서 다음과 같이 할 수도 있다.

```console
:e scp://user@server-name[:port]//path-to-file.txt
```

## sshfs
* ssh 프로토콜을 이용하여 원격지를 마운트하여 로컬의 파일처럼 접근할 수 있다.
* Docker 이미지로는 `vieux/sshfs` 가 있다.

```console
$ sudo apt-get install sshfs
$ sudo adduser <username> fuse
$ mkdir ~/remoteserv  
$ sshfs -o idmap=user <username>@<ipaddress>:/remotepath ~/remoteserv
```

## REFERENCE
스텍오버플로우 질답: https://unix.stackexchange.com/questions/202918/how-do-i-remotely-edit-files-via-ssh
