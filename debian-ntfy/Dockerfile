FROM me/debian-base:11 AS install
WORKDIR /install
ARG NTFY_VERSION
RUN set -uex; \
    file_label="ntfy_${NTFY_VERSION}_linux_x86_64"; \
    file_name="${file_label}.tar.gz"; \
    curl -sSfLlo "${file_name}" "https://github.com/binwiederhier/ntfy/releases/download/v${NTFY_VERSION}/${file_name}";\
    tar zxvf "${file_name}"; \
    mv "${file_label}" "ntfy";

#FROM docker.io/debian:11
FROM gcr.io/distroless/cc-debian11:latest
COPY --from=install /install/ntfy/ntfy /usr/bin/ntfy
COPY --from=install /install/ntfy/server /etc/ntfy
CMD [ "ntfy", "serve" ]
