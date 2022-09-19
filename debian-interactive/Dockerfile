FROM me/debian-base:latest

RUN set -uex;\
    apt-get update;\
    apt-get -y install procps jq less vim-tiny man curl wget xz-utils zstd;\ 
    apt-get clean;
