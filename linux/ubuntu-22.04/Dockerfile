FROM docker.io/ubuntu:jammy

USER root
WORKDIR /root

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.aliyun.com@g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ca-certificates \
    && sed -i 's/http:/https:/g' /etc/apt/sources.list

RUN apt-get install -y wget vim build-essential git cmake python3 python3-pip

RUN wget -nv 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' -O conda.sh \
    && bash conda.sh -b -p /opt/conda \
    && rm conda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
