FROM docker.io/debian:11 AS install

RUN set -uex;\
    apt-get update;\
    apt-get -y install curl unzip;
RUN curl -sSfLl https://github.com/denoland/deno/releases/download/v1.29.2/deno-x86_64-unknown-linux-gnu.zip > /deno-x86_64-unknown-linux-gnu.zip
RUN set -uex;\
    unzip /deno-x86_64-unknown-linux-gnu.zip;\
    chmod 755 /deno;\
    chown -R root:root /deno;

FROM gcr.io/distroless/cc-debian11:latest
COPY --from=install /deno /deno
RUN [ "/deno", "repl", "--eval", "close()" ]
ENTRYPOINT [ "/deno" ]
CMD [ "repl" ]
