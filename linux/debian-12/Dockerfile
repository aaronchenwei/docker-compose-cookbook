FROM docker.io/debian:bookworm

USER root
WORKDIR /root

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ca-certificates \
    && sed -i 's/http:/https:/g' /etc/apt/sources.list.d/debian.sources

RUN apt-get install -y wget vim build-essential git
