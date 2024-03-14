---
title: Rclone 원격 백업 툴
date: 2022-08-31T17:56:35+09:00
lastmod:
tags: ["rclone","backup"]
categories: ["tools"]
---

## Install
```console
$ sudo apt install rclone
$ rclone --help
$ rclone config
n/s/q> n
name> gdrive # rclone 사용시 원격지 드라이브 이름으로 사용
Storage> 13  # google
client_id> Enter
client_secret> Enter
scope> 1
root_folder_id> Enter
service_account_file> Enter
Edit advanced config?> n 
Use auto config? n  # 출력된 url을 복사하여 브라우저에 입력하고 승락하기
                    # 승락한 후 받은 key를 복사
Enter verification code> key입력
Configure this as a team drive? n
y) Yes this is OK (default) y
q # 끝내기
```

## Usage

* 기본 사용법: 세세한 옵션이 많지만 흐름을 잃지 말자. 필요하면 관련 문서 참조.
```console
$ rclone ls gdrive:                 # list google drive files only
$ rclone lsl gdrive:                # list -l google drive files only
$ rclone lsd gdrive:                # list google drive folders
$ rclone copy file1 gdrive:         # copy file1 to gdrive:
$ rclone copy dir1 gdrive:          # copy dir1/* to gdirve:
                                    # 디렉토리내 파일복사
$ rclone copy dir1 gdrive:dir1      # copy dir1 to gdirve:dir1
                                    # dir1 디렉토리복사
$ rclone delete gdrive:file1        # remove gdrive:file1
$ rclone delete gdrive:dir1         # remove gdrive:dir1

$ mkdir ~/gdrive 
$ rclone sync gdrive: ~/gdrive/     # sync google drive to local ~/gdrive
$ rclone sync ~/gdrive gdrive:      # sync ~/gdrive to google drive
$ rclone sync -i ~/gdrive gdirve:   # interactive mode
$ rclone sync -P ~/gdrive gdirve:   # view real-time transfer statistics

$ rclone bisync ~/gdrive gdirve:    # bidirectional sync between two paths
                                    # new, Newer, and Deleted files
```

* Mount
```console
$ rclone mount gdrive: ~/google-drive &
$ ls ~/google-drive
```

## Crypt - 암호화

* `gdrive:` 내의 특정 폴더를 암호화해서 gdrive내에서는 내용을 볼 수 없고 오직 local에서만 가능하다. 개인정보를 보다 안전하게 보관할 수 있는 방법이다.
* 아래의 설정 요지는 `gdrive:`에서 암호화할 폴더를 지정해주고 서로 다른 비밀번호 두 개를 입력하는 것이다. 이유는 `salt`라는 개념으로 암호화를 보다 더 견고하게 하는 데 있다.

* Setup
  
```console
$ rclone mkdir gdrive:data
$ rclone config
make a new one? 
n/s/q> n
name> secret                        # 접근시 사용할 원격드라이브 이름
Storage> crypt                      # 암호화 설정
remote> gdrive:data                 # 기존 등록한 드라이브 내의 폴더이름
filename_encryption> Enter          # default:1:standard
directory_name_encryption> Enter    # default:1:true 디렉토리 이름도 암호화
Password or pass phrase for encryption.
y/g/n> y                            # y: 이후 첫번째 패스워드 두 번 입력
Password or pass phrase for salt. Optional but recommended.
Should be different to the previous password.
y/g/n> y                            # y: 이후 두번째 패스워드 두 번 입력
Edit advanced config? (y/n)
y/n> n                              # n: 고급설정 안함
Remote config
--------------------
[secret]
remote = gdrive:data
password = *** ENCRYPTED ***
password2 = *** ENCRYPTED ***
--------------------
y) Yes this is OK (default)
e) Edit this remote
d) Delete this remote
y/e/d> y                            # y: 
Current remotes:

Name                 Type
====                 ====
gdrive               drive
secret               crypt

e) Edit existing remote
n) New remote
d) Delete remote
r) Rename remote
c) Copy remote
s) Set configuration password
q) Quit config
e/n/d/r/c/s/q> q                    # q: secret, crypt 리스트에서 확인, 나감
```

* Usage

```console
$ rclone copy my_test_file secret:  # file remote copy test
$ rclone ls secret:                 # 확인
```
* 기본 테스트가 완료되면 구글드라이브에서 암호화되어 올라갔는지 확인.

* 사용례 - 로컬의 백업데이타 `~/data`를 `secret:`에 동기화(i.e. `gdirve:data/`)
```console
$ rclone sync ~/data secret:
```

## 참고 사항

* `rclone mount`로 직접 마운트하여 사용하기 보다는 `rclone sync`로 사용하는 것이 바람직할 것 같다.
* 실수로 데이터를 지우는 일이 발생하거나 파일 변경시 특정파일만 복사하기가 매우 번거롭기 때문이다. 하물며 `rclone copy`나 `rclone delete` 등은 어떠한가.
* 물론 `rclone sync`는 동기화하는 것이므로 로컬에서 지우면 원격지도 지워진다. 이것을 잘 이해하고 사용하여야 한다. `rclone copy`의 경우에는 동일한 파일의 경우 지워지지 않는다.
* 로컬 폴더에서 충분히 작업을 한 후 한 번씩 동기화(`local -> retmote`)해 준다.
* 이것이 귀찮으면 `cron`에 등록해 주어 일정 주기로 동기화한다.
* 로컬쪽에서 자신의 데이터에 문제가 생기면 `rclone sync`로 복구(`remote -> local`)해 준다.
* 로컬 컴퓨터가 바뀌는 경우에는 `rclone`을 설치하고 위 설정 과정을 똑같이 반복해 주면 된다. 물론 두 개의 패스워드는 기억하고 있어야 한다.

## Links

* 기본 사용 문서: <https://rclone.org/docs/>
* 암호화: <https://rclone.org/crypt/>
