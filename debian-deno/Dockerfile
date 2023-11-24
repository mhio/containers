FROM me/debian-base:12 AS install
ARG DENO_VERSION
RUN set -uex;\
    apt-get -qy update;\
    apt-get -y install unzip;
RUN set -uex;\
    curl -sSfLl "https://github.com/denoland/deno/releases/download/v${DENO_VERSION}/deno-x86_64-unknown-linux-gnu.zip" > /deno-x86_64-unknown-linux-gnu.zip;\
    sha256sum deno-x86_64-unknown-linux-gnu.zip;\
    unzip /deno-x86_64-unknown-linux-gnu.zip;\
    rm /deno-x86_64-unknown-linux-gnu.zip;\
    chmod 755 /deno;\
    chown -R root:root /deno;

FROM gcr.io/distroless/cc-debian12:latest
COPY --from=install /deno /deno
#RUN [ "/deno", "repl", "--eval", "console.log(Deno.version.deno); close()" ]
RUN [ "/deno", "repl", "--eval", "close()" ]
ENTRYPOINT [ "/deno" ]
CMD [ "repl" ]

