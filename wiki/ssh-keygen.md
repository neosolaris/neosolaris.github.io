---
title: ssh-keygen 으로 인증하기
date: 2022-09-02T15:09:16+09:00
lastmod:
tags: ["ssh","ssh-keygen","sshd","security"]
categories: ["shell"]
---

## Intro

* remote: authorized_keys 인증 허가
* local: ssh-keygen으로 키를 생성
* local: ssh-copy-id로 remote에 복사
* local: ssh로 패스워드 없이 로그인확인
* remote: Password로 로그인 불허가 설정 

## remote: authorized_keys 인증허가 (되어있다면 다음으로)

```console
$ sudo vi /etc/ssh/sshd_config
...
PermitRootLogin no #root로 로그인불가

RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile      %h/.ssh/authorized_keys 
...

$ sudo systemctl restart ssh
```

## local: ssh-keygen 보안키 생성하기 (-t: type, -C: Comment)
* passphrase는 그냥 엔터 2번
* 생성위치는 ~/.ssh/id_ed25519{.pub}

```console
$ ssh-keygen -t ed25519 -C "batutah@gmail.com" 
```

## local: ssh-copy-id로 public key를 remote에 복사
* local: ~/.ssh/id_ed25519.pub -> remote: ~/.ssh/authorized_keys

```console
$ ssh-copy-id -p81 borisu@192.168.1.101 #remote 패스워드 입력
```

## local: ssh로 패스워드 없이 로그인 확인

```console
$ ssh -p81 borisu@192.168.1.101
```

## remote: sshd에서 패스워드인증 허가를 막기
* 키인증으로 로그인이 가능하므로 패스워드 인증을 막아줌

```console
$ sudo vi /etc/ssh/sshd_config
...
PasswordAuthentication no
...

$ sudo systemctl restart ssh
```

## Reference
* <https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04>
* <https://www.answertopia.com/ubuntu/configuring-ssh-key-based-authentication-on-ubuntu/>
