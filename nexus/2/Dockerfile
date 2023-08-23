FROM docker.io/sonatype/nexus3:latest

USER root

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && microdnf update -y \
    && microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y gperftools-libs jemalloc mimalloc \
    && microdnf clean all

USER nexus

ENV LD_PRELOAD /usr/lib64/libtcmalloc.so.4
# ENV LD_PRELOAD /usr/lib64/libjemalloc.so.2
# ENV LD_PRELOAD /usr/lib64/libmimalloc.so.2

# ENV MALLOC_ARENA_MAX 4
# ENV MALLOC_ARENA_MAX 1

ENV INSTALL4J_ADD_VM_PARAMS="-XX:+AlwaysPreTouch -XX:+UseG1GC -Xms2703m -Xmx2703m -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs"
