FROM me/debian-base:12 AS install
SHELL [ "/bin/sh", "-uexc" ]

ARG NODE_VERSION
WORKDIR /build
RUN label="node-v${NODE_VERSION}-linux-x64"; \
    file="${label}.tar.xz"; \
    echo $file; \
    curl -sSfLl "https://nodejs.org/download/release/v${NODE_VERSION}/${file}" > "${file}"; \
    sha256sum "$file"; \
    tar -xvf "$file"; \
    rm "$file"; \
    ls -l "/build/${label}"; \
    ln -s "/build/${label}" "/build/node";
#RUN apt-get update -qy; \
#    apt-get install openssl ca-certificates;

#FROM me/debian-base:12
#COPY --from=install "/build/node" /usr/local

FROM gcr.io/distroless/cc-debian12:latest
COPY --from=install "/build/node" /usr/local
RUN [ "/usr/local/bin/node", "--eval", "console.log(process.version); process.exit()" ]
#ENTRYPOINT [ "/usr/local/bin/node" ]

