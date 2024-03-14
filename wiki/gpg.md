---
title: GPG - GNU Privacy Guard
date: 2023-09-09T16:32:54+09:00
lastmod:
tags: ['gpg','security','password']
categories: ['tools']
---

## Intro
* GNU Privacy Guard, is a public key cryptography implementation.

## Install
* Alpine
```
$ doas apk add gpg gpg-agent
```
* Ubuntu/Debian
```
$ sudo apt-get install gnupg
```

## Setup
* gpg 키생성: default로 진행: Real name과 Email 입력: 비밀번호 입력
* 암호화방식: 최신의 ECC(ed25519) 방식 사용
```
$ gpg --full-gen-key
```

## Create a Revocation Certificate
* 무효화 인증키 생성 (보안키분실시 사용, 따로 잘 보관)
* 파일모드가 600인지 확인
```
$ gpg --output ~/revocation.crt --gen-revoke your_email@address.com
```

## How To Import Other Users’ Public Keys
```
$ gpg --import name_of_pub_key_file
```

## How To Verify and Sign Keys
```
$ gpg --fingerprint your_email@address.com 
$ gpg --list-keys       # 키리스트 확인
$ gpg --armor --export  # public key 확인

-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEZPwe2hYJwKYBBAHaRw8BAQdATXg1HK+wZW/sZlDXfs7KEJeEyX6YRKx9a60c
P5pj4mwtAPwP2wq1ACEdj+V6VOH/1ZE5KlH7L8UkYlJ8lK+ZdZBK+wEAlknNS5O7
...
-----END PGP PUBLIC KEY BLOCK-----
```

## Encrypt and Decrypt Messages with GPG
* Encrypt Messages
```
$ gpg --encrypt --sing --armor -r <your_email@address.com> <name_of_file>
$ ls
$ <name_of_file>.asc
```
* Decrypt Messages
```
$ gpg <name_of_file>.asc
```

## Key Maintenance
```
$ gpg --list-keys    # list available GPG keys
$ gpg --refresh-keys # update the key information
$ gpg --keyserver <key_server> --refresh-keys  # pull information from a specific key server
```

## Bakcup & Restore
* backup (사용중인 PC)
```
# tree로 ~/.gnupg 확인
tree ~/.gnupg

# 현재 사용중인 키 확인
gpg --list-secret-keys --keyid-format LONG

# 백업
mkdir ~/gpg-backup
gpg --export --export-options backup --output ~/gpg-backup/public-key.gpg
gpg --export-secret-keys --export-options backup --output ~/gpg-backup/private-key.gpg
gpg --export-ownertrust > ~/gpg-backup/trust_key.gpg
tar cvf <USB-mount-path>/gpg-backup.tar gpg-backup
```

* restore (다른 PC)
```
# USB mount
tar xvf <USB-mount-path>/gpg-backup.tar
cd gpg-backup/

# 키 복원
gpg --import public-key.gpg
gpg --import private-key.gpg
gpg --import-ownertrust trust-key.gpg

# 키 확인
gpg --list-secret-keys --keyid-format LONG
```

## PASS(The Standard Unix Password Manager) with gpg
* pass는 유닉스에서 개인의 패스워드를 관리하는 표준 툴이다.
* GPG와 연동하여 동작한다.
* 설치 및 사용 전에 `gpg --full-generate-key`로 먼저 자신의 GPG KEY가 준비되어 있어야 한다.

* Usage:
```
# package install (Alpine)
apk add pass

# Init: ~/.password-store (Check Key ID & Init)
gpg --list-secret-keys --keyid-format LONG
pass init CD177C430FA96E23

# Create New Password (single, multiline insert)
pass insert www/example
pass insert --multiline www/example2

# Password list
pass [list]

# Password Show
pass www/example
```

* Github Backup Restore
```
# backup
pass git init
pass git remote add origin git@github.com:<user-name>/pass-store.git
pass git push -u --all

# update
pass insert www/example3
pass git push -u --all

# restore (OS 재설치 또는 다른 컴퓨터)
pass git init
pass git remote add origin git@github.com:<user-name>/pass-store.git
pass git pull 
```

## Github에 GPG key 등록 후 사용하기


## REFERENCE
* How to use gpg : <https://www.digitalocean.com/community/tutorials/how-to-use-gpg-to-encrypt-and-sign-messages>
