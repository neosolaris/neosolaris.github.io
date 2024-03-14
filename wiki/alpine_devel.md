---
title: Alpine Devel - 알파인 개발 환경
date: 2023-12-30T06:03:08+09:00
lastmod:
tags: ['alpine','devel']
categories: ['alpine','linux']
---

## Setup

* build-base 설치 
    - binutils file gcc g++ make libc-dev fortify-headers patch

```
# Install build-base
doas apk add build-base

# Check
gcc --version
make --version
```
