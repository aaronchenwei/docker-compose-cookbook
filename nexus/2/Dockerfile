FROM docker.io/sonatype/nexus3:latest

USER root

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && microdnf update -y \
    && microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y gperftools-libs jemalloc \
    && microdnf clean all

USER nexus

# ENV LD_PRELOAD /usr/lib64/libtcmalloc.so.4
ENV LD_PRELOAD /usr/lib64/libjemalloc.so.2
