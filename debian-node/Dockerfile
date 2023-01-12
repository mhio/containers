FROM me/debian-base:11 AS install

ARG NODE_VERSION=18.13.0
WORKDIR /build
RUN set -uex;\
    file="node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    echo $file; \
    curl -sSfLl "https://nodejs.org/download/release/v${NODE_VERSION}/${file}" > "${file}"
RUN set -uex; \
    tar -xvf "node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    ls -l "/build/node-v${NODE_VERSION}-linux-x64"; \
    mv "/build/node-v${NODE_VERSION}-linux-x64" "/build/node"

FROM gcr.io/distroless/cc-debian11:latest
COPY --from=install "/build/node" /usr/local
ENTRYPOINT [ "/usr/local/bin/node" ]
