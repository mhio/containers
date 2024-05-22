# Install

ARG IMAGE_REPO
FROM ${IMAGE_REPO}/debian-base:12 AS install
SHELL [ "/bin/sh", "-uexc" ]

ARG VSCODIUM_VERSION
ARG VSCODIUM_ARCH=x64
ENV VSCODIUM_LABEL="vscodium-reh-linux-${VSCODIUM_ARCH}-${VSCODIUM_VERSION}"

WORKDIR /build

RUN echo "${VSCODIUM_LABEL}";\
    curl -sSfLl -o "${VSCODIUM_LABEL}.tar.gz" https://github.com/VSCodium/vscodium/releases/download/${VSCODIUM_VERSION}/${VSCODIUM_LABEL}.tar.gz;\
    sha256sum "${VSCODIUM_LABEL}.tar.gz";

RUN mkdir "vscodium-server-linux-${VSCODIUM_ARCH}";\
    tar -C "vscodium-server-linux-${VSCODIUM_ARCH}" -xvf "/build/${VSCODIUM_LABEL}.tar.gz";\
    echo "${VSCODIUM_LABEL}" > "vscodium-server-linux-${VSCODIUM_ARCH}/.container-build"


# Output

FROM docker.io/debian:12-slim

ARG VSCODIUM_ARCH=x64
ARG UID=500

COPY --from=install /build/vscodium-server-linux-${VSCODIUM_ARCH}/ /usr/local/vscodium-server-linux-${VSCODIUM_ARCH}
RUN cd /usr/local/ && ln -vs vscodium-server-linux-${VSCODIUM_ARCH} vscodium-server
RUN set -uex;\
    mkdir /user;\
    chown "${UID}" /user;
RUN find /usr/local/vscodium-server-linux-${VSCODIUM_ARCH} | sort
RUN /usr/local/vscodium-server-linux-${VSCODIUM_ARCH}/bin/codium-server --help
RUN /usr/local/vscodium-server/bin/codium-server --help

ENTRYPOINT [ "/usr/local/vscodium-server/bin/codium-server", "--telemetry-level", "off" ]
CMD []
