FROM docker.io/debian:11 AS install

RUN set -uex;\
    apt-get update;\
    apt-get -y install curl unzip;
RUN curl -sfLl https://github.com/denoland/deno/releases/download/v1.25.3/deno-x86_64-unknown-linux-gnu.zip > /deno-x86_64-unknown-linux-gnu.zip
RUN set -uex;\
    unzip /deno-x86_64-unknown-linux-gnu.zip;\
    chmod 755 /deno;\
    chown -R root:root /deno;

FROM docker.io/debian:11
COPY --from=install /deno /deno
