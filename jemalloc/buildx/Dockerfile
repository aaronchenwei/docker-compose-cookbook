# --------------- Builder stage ---------------
FROM centos:centos7 as builder

ENV JEMALLOC_VERSION=5.3.0

RUN yum update -y
#RUN yum -y install epel-release && yum -y update && yum clean all
RUN yum groupinstall -y "Development Tools"
RUN yum -y install wget
RUN yum clean all

RUN wget -O - https://github.com/jemalloc/jemalloc/releases/download/${JEMALLOC_VERSION}/jemalloc-${JEMALLOC_VERSION}.tar.bz2 | tar -xj
# COPY jemalloc-${JEMALLOC_VERSION}.tar.bz2 .
# RUN tar -xjvf jemalloc-${JEMALLOC_VERSION}.tar.bz2

RUN cd jemalloc-${JEMALLOC_VERSION} && \
   ./configure --prefix=/target/jemalloc && \
   make && \
   make install && \
   tar zcvf /jemalloc-${JEMALLOC_VERSION}.tar.gz -C /target ./jemalloc

# --------------- Final stage ---------------
FROM scratch

ENV JEMALLOC_VERSION=5.3.0

COPY --from=builder /jemalloc-${JEMALLOC_VERSION}.tar.gz /
