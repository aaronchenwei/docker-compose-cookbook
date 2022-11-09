FROM openjdk:8-buster as build

RUN apt-get update && \
    apt-get install -y curl netcat && \
    apt-get install -y --no-install-recommends git ca-certificates && \
    curl -L https://github.com/linkedin/cruise-control/archive/refs/tags/2.5.42.tar.gz -o /tmp/2.5.42.tar.gz && \
    echo "ffecb66e76039ba221250c6c158f6fcba25d6b868a13fa35277adc7d2c3f4485b645c7d3aafbb6df5af0a34b98abd8139f4b04aa0b40a6e994744475ac5c1ebd  /tmp/2.5.42.tar.gz" | sha512sum -c && \
    tar xf /tmp/2.5.42.tar.gz -C /usr/local && \
    ln -s /usr/local/cruise-control-2.5.42 /usr/local/cruise-control && \
    useradd -ms /bin/bash cruisecontrol && \
    chown -R cruisecontrol:cruisecontrol /usr/local/cruise-control-2.5.42 && \
    rm /tmp/2.5.42.tar.gz && \
    cd /usr/local/cruise-control && \
    git init && \
    ./gradlew jar && \
	./gradlew jar copyDependantLibs

EXPOSE 9090
ENTRYPOINT ["/usr/local/cruise-control/kafka-cruise-control-start.sh", "/usr/local/cruise-control/config/cruisecontrol.properties"]
