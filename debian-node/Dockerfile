FROM me/debian-base:12 AS install
SHELL [ "/bin/sh", "-uexc" ]

ARG NODE_VERSION
WORKDIR /build
RUN file="node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    echo $file; \
    curl -sSfLl "https://nodejs.org/download/release/v${NODE_VERSION}/${file}" > "${file}"; \
    tar -xvf "node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    rm "node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    ls -l "/build/node-v${NODE_VERSION}-linux-x64"; \
    mv "/build/node-v${NODE_VERSION}-linux-x64" "/build/node";
#RUN apt-get update -qy; \
#    apt-get install openssl ca-certificates;

#FROM me/debian-base:12
#COPY --from=install "/build/node" /usr/local

FROM gcr.io/distroless/cc-debian12:latest
COPY --from=install "/build/node" /usr/local
RUN [ "/usr/local/bin/node", "--eval", "console.log(process.version); process.exit()" ]
ENTRYPOINT [ "/usr/local/bin/node" ]

