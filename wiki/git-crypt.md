---
title: Git-Crypt - github에 동기화할 때 자동 암호화
date: 2023-08-27T22:36:46+09:00
lastmod: 2023-08-27T22:38:00+09:00
tags: ['git','git-crypt','github','암호화']
categories: ['programming']
---

## Intro
- Github에 소스코드를 올릴 때 암호화 할 수 있는 툴
- 올릴 때에는 암호화해서 올리고 다운로드 시에는 복호화 해준다.
- 보안키나 패스워드, 중요 설정 정보 등이 공개용 뿐만 아니라  비공개용 저장소에 올릴 때에도 유용하다.
- 아울러 vimwiki나 지극히 개인적인 문서를 저장할 때 github를 이용할 경우에도 매우 유용하다.
- Github 자체가 해킹되는 경우도 있고, github의 자료는 모두 깃허브의 재산이므로 내 자료를 보호할 필요가 있다.
- 아무리 비공개용이라 할지라도 꺼림직하기는 마찬가지다.
- 이렇게 해 두면 좋은 점은 PC가 바뀌어도 작업 장소가 바뀌어도 모두 안전하게 개인자료를 동기화할 수 있다.
- 물론 개인자료를 에버노트나 구글계정에 저장해도 되겠지만 이곳도 근본적으로 보안상태는 마찬가지이다.
- 또한 개발자, 작가 등은 손쉽게 github를 통해 저장소를 두고 작업을 하는 것이 편리하다.
- 그렇기에 작고 가볍고 의존성도 없는 git-crypt를 활용하게 된 것이다.
- 아래 상술하겠으나 저장소를 여러 개 쓸 경우 그 만큼 관리할 키가 늘어나고 따로 보관해야 하는 문제가 생긴다.
- 암호화가 필요한 파일은 가급적 한 저장소에 모으고 하나의 키만 따로 USB나 기타 장소에 보관해 두는 것이 좋겠다.
- 만약 git-crypt에 의해 생긴 키도 깃허브에 저장한다면 자기 모순에 빠지므로 별도로 백업 보관해야 한다.

## Install
```
$ sudo apt install git-crypt  # Ubuntu, Debian
$ doas apk add git-crypt      # Alpine
```

## Using git-crypt
- 주의사항: git-crypt를 적용하기 전의 데이터는 암호화 할 수 없다.
- 따라서 github에서 새로운 저장소를 만들고 아래 절차를 진행해야 한다.
- 아래 your_secret_file 과 your_secret_directory는 저장소 내의 암호화할 파일 또는 폴더.

```
$ git clone git@github.com:<github_user>/<your_progject_name>
$ cd <your_project_name>
$ git-crypt init

$ cat <<EOF  > .gitattributes
your_secret_file_name filter=git-crypt diff=git-crypt
*.key filter=git-crypt diff=git-crypt
your_secret_dir/** filter=git-crypt diff=git-crypt
EOF

$ echo "hello world" > your_secret_file
$ echo "hello world" > your_secret_dir/file1

$ git add . && git commit "update files" && git push
```

- 자신의 깃허브 저정소에 가서 올린 파일이 암호와 되었는지 로그인해서 확인한다.
- 보통의 경우 위 설정이 잘 되었으면 평상시 대로 git을 사용하면 저장소 관리가 된다.

## 생성된 암호키 관리
- 위의 `git-crypt init` 명령을 수행하면 `.git/git-crypt/keys`로 초기화되고 키가 생성, 보관된다.
- Symmetric Mode: 생성된 키는 로컬에만 존재하므로 이 키를 USB 등에 저장해 두었다가 다른 곳에서 깃허브 저장소를 다운 받은 후 이를 사용하면 된다.
- GPG Mode: 또한 다른 사용자의 키를 추가시켜 그 사용자가 저장소에 접근할 수 있도록 할 수 있다. (자신 포함)

* GPG Mode -  자신 또는 다른 사용자의 키를 추가하는 경우
```
$ git-crypt add-gpg-user <USER_ID>  # 주 사용자모드: USER_ID is Public GPG key ID
...
$ git clone git@github.com:<github_user>/<your_progject_name>  # 허락받은 사용자모드
$ cd <your_project_name>
$ git-crypt unlock
```

* Symmetric Mode - 키를 가지고 있는 사용자(보통 자기자신)이 저장소를 사용할 수 있는 방법
```
$ git-crypt export-key <path_to_your_keyfile>  # 주 사용자가 키를 백업하기
...
$ git clone git@github.com:<github_user>/<your_progject_name>  # 다른 곳에서 복호화 하기
$ cd <your_project_name>
$ git-crypt unlock <path_to_your_keyfile>   # 백업해둔 키파일을 이용해 복호화하기
```

## 참고사항
- `.gitattributes` 파일 자신은 암호화되서는 안된다고 메뉴얼에 나와 있다.
- `.gitattributes` 파일에 `dir/**`에서 `**`이 두 개인 이유는 이하 서브 디렉토리에서도 적용시킬 수 있기 때문이다.
- 상당히 많은 파일이나 폴더에 적용하는 것은 좋지 않다.
- 소스파일이나 텍스트 파일을 암호화 하는 데 적합하고 이진파일이나 데이터 파일에는 그리 적합하지 않다.
- 파일이름이나 파일에 대한 메타정보는 암호화하지 못한다. 즉 파일의 내용을 암호화 한다.

## REFERENCE
* Git-Crypt Home - <https://www.agwa.name/projects/git-crypt/>
* git-crypt github - <https://github.com/AGWA/git-crypt>
* managing secrets with git crypt - <https://dzone.com/articles/managing-secrets-with-git-crypt>
