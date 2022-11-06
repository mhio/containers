FROM docker.io/debian:11 AS install

ARG NODE_VERSION=18.12.1
WORKDIR /build
RUN set -uex;\
    apt-get update;\
    apt-get -y install curl
RUN set -uex;\
    file="node-v${NODE_VERSION}-linux-x64.tar.gz"; \
    echo $file; \
    curl -sSfLl "https://nodejs.org/download/release/v${NODE_VERSION}/${file}" > "${file}"
RUN set -uex; \
    tar -xvzf "node-v${NODE_VERSION}-linux-x64.tar.gz"; \
    ls -l "/build/node-v${NODE_VERSION}-linux-x64"; \
    mv "/build/node-v${NODE_VERSION}-linux-x64" "/build/node"

FROM gcr.io/distroless/cc-debian11:latest
COPY --from=install "/build/node" /usr/local
RUN [ "/usr/local/bin/node", "--eval", "'process.exit(0)'" ]
ENTRYPOINT [ "/usr/local/bin/node" ]
