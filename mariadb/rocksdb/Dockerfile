FROM mariadb:10.11

#See: https://github.com/docker-library/mariadb/issues/265
RUN dpkg-divert --add /bin/systemctl && ln -sT /bin/true /bin/systemctl
RUN apt-get update && apt-get install --no-install-recommends -y mariadb-plugin-rocksdb && \
        apt-get clean && \
        rm -rv /var/lib/apt/lists/*
