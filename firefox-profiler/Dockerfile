FROM docker.io/node:18-slim as build
SHELL [ "/bin/sh", "-uexc" ]

WORKDIR /build
RUN apt-get update -qy; \
    apt-get install -qy git;
RUN git clone https://github.com/firefox-devtools/profiler.git
WORKDIR /build/profiler
RUN yarn
# this needs > 4gb memory
RUN yarn test
RUN yarn build

FROM docker.io/nginx:1.24
WORKDIR /app
COPY --from=build /build/dist/. /usr/local
EXPOSE 8082

