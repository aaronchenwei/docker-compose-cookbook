FROM docker.io/bitnami/spark:3.3.2

USER root

# Install prerequisites
RUN apt-get update && apt-get install -y curl

RUN curl -O https://mirrors.huaweicloud.com/repository/maven/software/amazon/awssdk/s3/2.18.41/s3-2.18.41.jar \
    && curl -O https://mirrors.huaweicloud.com/repository/public/com/amazonaws/aws-java-sdk/1.12.367/aws-java-sdk-1.12.367.jar \
    && curl -O https://mirrors.huaweicloud.com/repository/public/io/delta/delta-core_2.12/2.2.0/delta-core_2.12-2.2.0.jar \
    && curl -O https://mirrors.huaweicloud.com/repository/public/io/delta/delta-storage/2.2.0/delta-storage-2.2.0.jar \
    && mv s3-2.18.41.jar /opt/bitnami/spark/jars \
    && mv aws-java-sdk-1.12.367.jar /opt/bitnami/spark/jars \
    && mv delta-core_2.12-2.2.0.jar /opt/bitnami/spark/jars \
    && mv delta-storage-2.2.0.jar /opt/bitnami/spark/jars
