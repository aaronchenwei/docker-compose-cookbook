FROM docker.io/debian:bullseye

USER root
WORKDIR /root

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ca-certificates \
    && sed -i 's/http:/https:/g' /etc/apt/sources.list

RUN apt-get install -y wget vim build-essential git

RUN wget -nv 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' -O conda.sh \
    && bash conda.sh -b -p /opt/conda \
    && rm conda.sh \
    && ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

# Make RUN commands use the new environment:
SHELL ["/bin/bash", "--login", "-c"]
RUN conda config --add channels conda-forge \
    && conda config --remove channels defaults \
    && conda create -q --name py39 python=3.9 \
    && conda clean -q -y --all \
    && echo "conda activate py39" >> ~/.bashrc

# Make RUN commands use the new environment:
SHELL ["/bin/bash", "--login", "-c"]
RUN pip install snap-stanford
