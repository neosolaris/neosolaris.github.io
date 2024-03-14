---
title: Rust Install and Setup
date: 2022-08-31T16:53:08+09:00
lastmod:
tags: ["rust", "install"]
categories: ["programming"]
---

## INSTALL

* install - 설치 후 `~/.bashrc`에 `~/.cargo` 자동 환경 설정
```console
$ curl https://sh.rustup.rs -sSf | sh -- --help
```

* rustup 업데이트/ 제거
```console
$ rustup update
$ rustup self uninstall
```

* rustc 컴파일러 버전확인
```console
$ rustc --version
```

## Hello World

```console
$ vim hello_world.rs
```

```rust
fn main() {
 #println!는 함수가 아닌 매크로
 println!("Hello, world!");
}
```

```console
$ rustc hello_world.rs
```

## Cargo를 통한 개발

```console
$ cargo new hello_cargo --bin
$ cd hello_cargo
$ vim src/main.rs
```

```rust
fn main() {
 println!("Hello, world!");
}
```

* `./target/debug/hello_cargo` 로 바이너리 생성
```console
$ cargo run   # compile and run
$ cargo run   # run only: source is not changed
$ cargo check # compile only no exe file create (rapid compile and test)
$ cargo clean # cleanup all object and binary files

$ cargo run -- --help #실행파일 인자를 받아서 실행할 때

$ cargo build 
$ cargo build --release (optimize for release)
```
* 모듈을 사용할 경우
```console
$ cargo add ansi_term #자동으로 Cargo.toml에 모듈이름과 버전이 등록된다.
$ vim src/main.rs #use ansi_term::xxxx 을 넣고 코딩
$ cargo run
```

## Build From Git
```console
$ git clone someurl.com/someproject
$ cd someproject
$ cargo build
```

## reference
* 제일 궁금한 것은 전체적인 개발 및 배포 과정인데 아래가 아주 좋음
	* <https://free-strings.blogspot.com/2017/03/cargo-cargo.html>
	* <https://rust-cli.github.io/book/tutorial/packaging.html>
* 아주 훌륭한 쿡북이다. 먼저 기본 온라인북을 보고서 이것을 공부하자.
	* <https://rust-lang-nursery.github.io/rust-cookbook/>
 
