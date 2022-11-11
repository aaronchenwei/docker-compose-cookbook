# syntax=docker/dockerfile:1.4

# --------------- Builder stage ---------------
FROM centos:centos7 as builder

ENV KAFKA_VERSION=3.0.1.34

RUN yum update -y
RUN yum install -y wget which java-11-openjdk-devel
RUN yum clean all

COPY init.gradle /root/.gradle/init.gradle

RUN wget -O kafka-${KAFKA_VERSION}.tar.gz https://github.com/linkedin/kafka/archive/refs/tags/${KAFKA_VERSION}.tar.gz
RUN tar zxvf kafka-${KAFKA_VERSION}.tar.gz && \
    rm kafka-${KAFKA_VERSION}.tar.gz

RUN cd kafka-${KAFKA_VERSION} && \
    sed -i 's/version=3.0.1-SNAPSHOT/version='"${KAFKA_VERSION}"'/g' gradle.properties

RUN cd kafka-${KAFKA_VERSION} && ./gradlew clean releaseTarGz

# --------------- Final stage ---------------
FROM scratch

ENV KAFKA_VERSION=3.0.1.34

COPY --from=builder /kafka-${KAFKA_VERSION}/core/build/distributions/kafka_2.12-${KAFKA_VERSION}.tgz /
