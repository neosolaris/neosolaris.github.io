---
title: Github 사용하기
date : 2022-08-23T18:35:04+09:00
lastmod: 2023-08-26T15:37:44+09:00
tags: ["git", "github"]
categories: ["devel"]
---

- 2023-08-26: TIP 추가: gitignore

## 깃허브 가입과 설정

* [GitHub Home](https://github.com) 에 가입한다.
* 새로운 저장소(Repository)를 만든다.
* 저장소의 주소를 확인한다.(Code 아이콘를 클릭)

## Github 제약사항

비공개 저장소(Private Repository): 유료에서 무료로 변경 (협업 3명까지)
Github 가격페이지 (개인용플랜 Free, 유료플랜 Pro)

* Pro의 장점

- 비공개 저장소에 대한 페이지와 위키 제공
- 비공개 저장소에 대한 공동작업자 무제한

2019.1월 기준으로 모든 Repository 및 파일 무제한
단, 다음을 권장

- 모든 Repository의 갯수는 무제한
- 각 Repository를 1GB가 넘지 않도록 한다.(100GB Hard Limit)
- 각 파일은 100MB를 넘지 않는다.

## Github 등록

```
username, email address
neosolaris/batutah@gmail.com
```

## git 설치

```console
sudo apt install git
```

## Create Repository

Repository Name: cmdTree
Security Stat: Private
initialize this repository with a README
Add .gitignore: 깃허브로 올리지 않을 파일 선택
Add a license: 저장소 생성과 함께 라이센스 파일의 설치가 자동 수행
My Address: https://github.com/neosolaris/cmdTree
Readme를 생성하지 말고

## Client Setup

* Git User Setup
```console
$ git config --global user.name neosolaris
$ git config --global user.email batutah@gmail.com
```

* New project Setup 
```
mkdir -p ~/mygit/cmdTree # 프로젝트 폴더 생성
cd ~/mygit/cmdTree       # 이동
git init                 # git 초기화 
git status               # 상태확인
( Coding ...)
touch Readme.txt         # 코딩 또는 파일 생성
git add Readme.txt       # git에 파일 추가
git add . (현재 디렉토리의 모든 파일)
git commit -m "Comment"  # 커밋해서 스냅샷 만들기
```

* 원격저장소 연결
```console
$ git remote add origin https://github.com/neosolaris/cmdTree.git
$ git remote -v           # 연결상태 확인
$ git push origin master  # 깃허브로 푸시
```

* 일과 정리
```
cd ~/mygit/cmdTree
git pull                  # check first before coding
( Coding ...)
git add . 
git commit -m "Edit ..."
git push
```

## Client Setup2

* 이것을 하기전에 [github ssh key 인증](github-ssh-key-인증)을 사용하여 github에 등록을 먼저한다.
* 그리고 저장소(repository)를 생성한다.

* Create New Repository Github.com
* client에서 하는 방법이 있는지는 아직 모르겠다.
* 저장소 생성은 우선 GitHub 홈페이지에서 만든다.

* Git User Setup
```console
cd ~/devel_git
git config --global user.name neosolaris
git config --global user.email batutah@gmail.com
git clone git@github.com:neosolaris/memo.git memo
cd memo
git remote set-url git@github.com:neosolaris/memo.git #저장소등록
```

* Coding and Push
```console
git pull
... (Coding)
git add .
git commit . -m "Edit..." 
git push
```

## 저장소 생성 및 업로드 - 최신

* Create a new repository on the command line
```console
echo "# myproject" >> README.mkdir
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:neosolaris/myproject.git
git push -u origin main
```

* Push an existing repository from the command line
```console
git remote add origin git@github.com:neosolaris/myproject.git
git branch -M main
git push -u origin main
```

## TIPS
* `.gitignore`
```console
$ vi ~/.gitignore
*.log
*.bak
temp/
.local/state/
:wq

$ git rm -r --cached .
$ git add .
$ git commit -m "Apply .gitignore"
```
