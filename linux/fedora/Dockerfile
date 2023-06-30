FROM docker.io/fedora:38

USER root
WORKDIR /root

RUN dnf makecache \
    && dnf upgrade -y \
    && dnf install vim gcc-c++ clang cmake ninja-build git -y \
    && dnf clean all
