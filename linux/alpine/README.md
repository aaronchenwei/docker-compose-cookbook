# Alpine Linux

## Launch sh in Alpine

```sh
$ docker compose up -d
$ docker compose exec alpine sh
``` 

## Choose a mirror

```sh

```
# aliyun
$ sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories

# tuna
$ sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

```

## Install packages

```sh
# apk add --no-cache ca-certificates
# apk update
# 
```
