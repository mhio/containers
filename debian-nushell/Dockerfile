FROM me/debian-base:11 AS install
WORKDIR /install
ARG NUSHELL_VERSION
RUN set -uex; \
    file_label="nu-${NUSHELL_VERSION}-x86_64-unknown-linux-gnu"; \
    file_name="${file_label}.tar.gz"; \
    curl -sSfLlo "${file_name}" "https://github.com/nushell/nushell/releases/download/${NUSHELL_VERSION}/${file_name}";\
    tar zxvf "${file_name}"; \
    mv "${file_label}" "nushell"; \
    cat /install/nushell/README.txt;

FROM me/debian-interactive:11
COPY --from=install /install/nushell/nu /usr/bin/nu
COPY 0.71/config.nu 0.71/env.nu /root/.config/nushell/
ENTRYPOINT [ "/usr/bin/nu" ]
