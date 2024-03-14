---
title: GitHub에 SSH Key로 인증하기
date : 2022-08-23T18:35:04+09:00
lastmod: 2022-08-24T03:55:36+09:00 
tags: ["git", "github", "ssh", "ssh-keygen"]
categories: ["devel", "linux"]
---
  
* Laste Updated: 2022.08.17
* 깃허브에서 정책이 변경되어 비밀번호로 인증을 더이상 지원하지 않는다.
* 다른 인증 방법은 github의 보안키 발급과 ssh key를 등록하는 방법이 있다.
* 여기에서는 ssh key를 만들어 github에 등록하여 사용하는 방법이다.

## CREATE SSH KEY: enter, enter, enter

* [rsa](rsa)로 키를 만들 경우
```console
ssh-keygen -t rsa -b 4096 -C $email
ls ~/.ssh/id_rsa      #private key
ls ~/.ssh/id_rsa.pub  #public key
```

* [ed25519](ed25519)로 키를 만들 경우 (추천: 보다 간결하고 강화된 방식)
```console
ssh-keygen -t ed25519 -C “yourmail@mail.com”
ls ~/.ssh/id_ed25519      #private key
ls ~/.ssh/id_ed25519.pub  #public key
```

## 생성한 pub 키를 GitHub에 등록하기

* 생성한 키 중 pub키를 복사한다.
* 깃허브에 로그인하여 다음 메뉴를 찾아 클릭.
	|Github Home > Settings > SSH and GPG Keys > New SSH Key
* Title에 제목을 입력하고 "Add SSH Key"를 눌러 등록 완료.

## 터미널에서 새로운 프로토콜(SSH 인증방식)으로 연결

* 깃허브에 성공적으로 연결되는 지 확인
```console
ssh -T git@github.com
```

* 깃허브에 연결 및 저장소 등록
```console
git remote set-url origin git@github.com:user_name/repo_name.git
```

## Comment

* 이 방식은 https방식보다 간결한 URL과 편리한 사용법이 좋다.
* 또한 깃허브로부터 인증키를 받는 방식은 기간제한이 있다. 
* 다른 컴퓨터에서 연결할 경우 ssh 키를 만들어 pub키를 깃허브에 추가해주면 된다.

## Reference

* <https://medium.com/ntust-aivc/instruction-for-adding-an-ssh-key-to-your-github-account-ubuntu20-04-3-lts-f9f7802ed734>
