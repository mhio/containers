FROM me/debian-base:12 AS install
SHELL [ "/bin/sh", "-uexc" ]

ARG NODE_VERSION
WORKDIR /build
RUN file="node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    echo $file; \
    curl -sSfLl "https://nodejs.org/download/release/v${NODE_VERSION}/${file}" > "${file}";
RUN tar -xvf "node-v${NODE_VERSION}-linux-x64.tar.xz"; \
    ls -l "/build/node-v${NODE_VERSION}-linux-x64"; \
    mv "/build/node-v${NODE_VERSION}-linux-x64" "/build/node";
#RUN apt-get update -qy; \
#    apt-get install openssl ca-certificates;

#FROM me/debian-base:11
#COPY --from=install "/build/node" /usr/local

#FROM gcr.io/distroless/cc-debian11:latest
FROM gcr.io/distroless/base-debian11:latest
COPY --from=install "/build/node" /usr/local
ENTRYPOINT [ "/usr/local/bin/node" ]

