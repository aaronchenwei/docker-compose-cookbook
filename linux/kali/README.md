# Kali Linux

## Launch bash in Kali

```sh
$ docker compose up -d
$ docker compose exec kali bash
```

## Choose a Kali Mirror

```sh
# sed -i "s@http://http.kali.org/kali@http://mirrors.aliyun.com/kali@g" /etc/apt/sources.list
```

## Install packages

```sh
# apt update
# apt upgrade
# apt install vim
# apt install build-essential
# apt install clang llvm
# apt install cmake
```
