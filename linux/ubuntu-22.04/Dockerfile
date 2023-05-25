FROM docker.io/ubuntu:jammy

USER root

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.aliyun.com@g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y ca-certificates && \
    sed -i 's/http:/https:/g' /etc/apt/sources.list

RUN apt-get install -y wget build-essential git cmake python3
