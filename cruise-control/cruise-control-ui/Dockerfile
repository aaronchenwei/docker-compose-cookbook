FROM node:16.14-buster as ccui

RUN curl -L https://github.com/linkedin/cruise-control-ui/archive/refs/tags/v0.4.0.tar.gz -o /tmp/v0.4.0.tar.gz && \
    echo "d4fabf920ca69616c432de8684c66ba42be94a2b83ab86486d2d4cf435215a057110df888ebde52f729330825d4949a363eee3047eb7291dcc9a0700f7a2609f /tmp/v0.4.0.tar.gz" | sha512sum -c && \
    tar xf /tmp/v0.4.0.tar.gz -C /usr/local && \
    ln -s /usr/local/cruise-control-ui-0.4.0 /usr/local/cruise-control-ui && \
    useradd -ms /bin/bash cruisecontrol && \
    chown -R cruisecontrol:cruisecontrol /usr/local/cruise-control-ui-0.4.0 && \
    rm /tmp/v0.4.0.tar.gz && \
    cd /usr/local/cruise-control-ui && \
    npm install && \
    npm run build

FROM nginx
COPY --from=ccui /usr/local/cruise-control-ui/dist/ /usr/share/nginx/html/
EXPOSE 80
