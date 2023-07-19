FROM docker.io/bitnami/kafka:3.5

USER root

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y libjemalloc-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV LD_PRELOAD /usr/lib/x86_64-linux-gnu/libjemalloc.so

USER 1001
