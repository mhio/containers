FROM debian:11

RUN set -uex;\
    apt-get update;\
    apt-get -y install zsh jq less vim-tiny man curl wget xz-utils zstd;\ 
    apt-get clean;
COPY .zshrc /root/.zshrc
WORKDIR /root
ENV USER=root
CMD [ "zsh" ]
