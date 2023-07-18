FROM docker.io/alpine:3.18 as build

ENV CMAK_VERSION 3.0.0.6

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add --update curl unzip && \
    rm -rf /var/cache/apk/*

RUN <<EOF
    set -e
    curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip
    unzip /tmp/cmak.zip -d /
    ln -s /cmak-$CMAK_VERSION /cmak
    rm -rf /tmp/cmak.zip
EOF

FROM eclipse-temurin:11-jre-alpine
COPY --from=build /cmak /cmak
VOLUME /cmak/conf
ENV JAVA_OPTS=-XX:MaxRAMPercentage=80
WORKDIR /cmak
ENTRYPOINT ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]
