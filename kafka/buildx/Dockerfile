# --------------- Builder stage ---------------
FROM centos:centos7 as builder

ENV KAFKA_VERSION=2.4.1.59

RUN yum update -y
RUN yum install -y wget which java-1.8.0-openjdk-devel
RUN yum clean all

RUN wget -O kafka-${KAFKA_VERSION}.tar.gz https://github.com/linkedin/kafka/archive/refs/tags/${KAFKA_VERSION}.tar.gz
RUN tar zxvf kafka-${KAFKA_VERSION}.tar.gz && \
    rm kafka-${KAFKA_VERSION}.tar.gz

RUN cd kafka-${KAFKA_VERSION} && \
    sed -i 's/version=2.4.2-SNAPSHOT/version='"${KAFKA_VERSION}"'/g' gradle.properties && \
    ./gradlew clean releaseTarGz

# --------------- Final stage ---------------
FROM scratch

ENV KAFKA_VERSION=2.4.1.59

COPY --from=builder /kafka-${KAFKA_VERSION}/core/build/distributions/kafka_2.12-${KAFKA_VERSION}.tgz /
