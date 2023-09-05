FROM docker.io/ubuntu:jammy

USER root
WORKDIR /root

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.tuna.tsinghua.edu.cn@g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ca-certificates \
    && sed -i 's/http:/https:/g' /etc/apt/sources.list

RUN apt-get install -y wget vim build-essential git cmake python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*
