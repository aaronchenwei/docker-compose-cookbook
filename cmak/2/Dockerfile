# syntax=docker/dockerfile:1.4
FROM debian:bullseye as build

ENV CMAK_VERSION 3.0.0.6

RUN apt-get update && apt-get install -y zip unzip curl

RUN <<EOF
    set -e
    curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip
    unzip /tmp/cmak.zip -d /
    ln -s /cmak-$CMAK_VERSION /cmak
    rm -rf /tmp/cmak.zip
EOF

FROM eclipse-temurin:11-jre
COPY --from=build /cmak /cmak
VOLUME /cmak/conf
ENV JAVA_OPTS=-XX:MaxRAMPercentage=80
WORKDIR /cmak
ENTRYPOINT ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]
