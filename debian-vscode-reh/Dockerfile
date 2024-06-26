ARG IMAGE_REPO
FROM ${IMAGE_REPO}/debian-base:12 AS install
SHELL [ "/bin/sh", "-uexc" ]

ARG VSCODE_COMMIT
ARG VSCODE_ARCH=x64
WORKDIR /build

RUN label="vscode-${VSCODE_COMMIT}-linux-${VSCODE_ARCH}-stable"; \
    file="${label}.tar.xz"; \
    echo $file; \
    curl -sSfLl -o "${file}" "https://update.code.visualstudio.com/commit:${VSCODE_COMMIT}/server-linux-${VSCODE_ARCH}/stable"; \
    sha256sum "$file"; \
    tar -xvf "$file"; \
    rm "$file"; \
    ls -l "/build/vscode-server-linux-${VSCODE_ARCH}";

# Output
ARG IMAGE_REPO
FROM docker.io/debian:12-slim

ARG VSCODE_ARCH=x64
ARG UID=500

COPY --from=install /build/vscode-server-linux-${VSCODE_ARCH} /usr/local/vscode-server-linux-${VSCODE_ARCH}
RUN set -uex;\
    cd /usr/local/;\
    ln -vs vscode-server-linux-${VSCODE_ARCH} vscode-server;\
    mkdir /user;\
    chown "${UID}" /user;
RUN find /usr/local/vscodium-server-linux-${VSCODE_ARCH} | sort
RUN [ "/usr/local/vscode-server/bin/code-server", "--help"]

USER ${UID}

ENTRYPOINT [ "/usr/local/vscode-server/bin/code-server", "--accept-server-license-terms",  "--telemetry-level=off", "--server-data-dir=/user", "--user-data-dir=/user", "--host=0.0.0.0" ]
CMD []
