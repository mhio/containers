ARG IMAGE_REPO
FROM ${IMAGE_REPO}/debian-base:12 AS install
WORKDIR /install
ARG NTFY_VERSION
RUN set -uex; \
    file_label="ntfy_${NTFY_VERSION}_linux_amd64"; \
    file_name="${file_label}.tar.gz"; \
    curl -sSfLlo "${file_name}" "https://github.com/binwiederhier/ntfy/releases/download/v${NTFY_VERSION}/${file_name}";\
    tar zxvf "${file_name}"; \
    rm "${file_name}"; \
    mv "${file_label}" "ntfy";


# Output

#FROM docker.io/debian:12-slim
FROM gcr.io/distroless/cc-debian12:latest
COPY --from=install /install/ntfy/ntfy /usr/bin/ntfy
COPY --from=install --chown=1009 --chmod=0400 /install/ntfy/server /etc/ntfy
USER 1009
CMD [ "/usr/bin/ntfy", "serve" ]
