FROM docker.io/alpine:3.18.2

USER root
WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add --update curl wget bash unzip && \
    rm -rf /var/cache/apk/*
