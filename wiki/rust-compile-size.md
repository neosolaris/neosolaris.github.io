---
title: Rust Compile시 용량 줄이기
date: 2022-08-31T16:50:25+09:00
lastmod:
tags: ["rust","compile","size"]
categories: ["programming"]
---

## Intro

debug > release 순으로 엄청난 바이너리 사이즈를 자랑한다.
우선 개발과 디버깅을 병행한 후에 최종 릴리즈시에 적용한다.
방법은 다음과 같다.

## Howto

* Cargo.toml에 다음을 추가한다.
```toml
[profile.release]
lto = true
codegen-units = 1
opt-level = "z"
panic = 'abort'
```
* build
```console
cargo build --release
```


## reference
* <https://www.collabora.com/news-and-blog/blog/2020/04/28/reducing-size-rust-gstreamer-plugin/>
* <https://github.com/johnthagen/min-sized-rust>

