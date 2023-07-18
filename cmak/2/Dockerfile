FROM docker.io/redhat/ubi9-minimal as build

ENV CMAK_VERSION 3.0.0.6

RUN microdnf install -y unzip \
    && microdnf clean all

RUN set -e \
    && curl -L https://github.com/yahoo/CMAK/releases/download/${CMAK_VERSION}/cmak-${CMAK_VERSION}.zip -o /tmp/cmak.zip \
    && unzip /tmp/cmak.zip -d / \
    && ln -s /cmak-$CMAK_VERSION /cmak \
    && rm -rf /tmp/cmak.zip

FROM docker.io/eclipse-temurin:11-jre-ubi9-minimal
COPY --from=build /cmak /cmak
VOLUME /cmak/conf
ENV JAVA_OPTS=-XX:MaxRAMPercentage=80
WORKDIR /cmak
ENTRYPOINT ["/cmak/bin/cmak", "-Dpidfile.path=/dev/null", "-Dapplication.home=/cmak", ""]
