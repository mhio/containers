ARG IMAGE_REPO
FROM ${IMAGE_REPO}/debian-base:12 AS install
SHELL [ "/bin/sh", "-uexc" ]

ARG COMMAFEED_VERSION
WORKDIR /build
RUN file_name="commafeed.jar"; \
    curl -sSfLlo "commafeed.jar" "https://github.com/Athou/commafeed/releases/download/${COMMAFEED_VERSION}/${file_name}";\
    curl -sSfLlo "config.yml" "https://github.com/Athou/commafeed/releases/latest/download/config.yml.example";\
    ls -al /build;\
    echo done;


# Output

FROM gcr.io/distroless/java21-debian12:latest
WORKDIR /app
COPY --from=install "/build/commafeed.jar" "/build/config.yml" /app/
ENTRYPOINT []
VOLUME /commafeed/data
EXPOSE 8082
CMD [ "/usr/bin/java", "-Djava.net.preferIPv4Stack=true", "-jar", "/app/commafeed.jar", "server", "/app/config.yml" ]
