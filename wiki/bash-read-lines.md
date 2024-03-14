---
title: Bash readlines how to
date: 2022-08-26T21:54:04+09:00
lastmod:
tags: ["shell","bash", "programming","read lines"]
categories: ["shell","programming"]
---                                                                         

## Method 1

```bash
for read -r line 
do
	echo $line	
done < input_file.txt > out_file.txt
```

## Method 1
```bash
file=$(cat input_file.txt)

for line in  $file
do
	echo $line	
done < input_file.txt > out_file.txt
```

## Links
<https://www.geeksforgeeks.org/bash-scripting-how-to-read-a-file-line-by-line/>
