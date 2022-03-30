FROM me/debian-interactive:11

RUN set -uex;\
    apt-get update;\
    apt-get -y install zsh;\ 
    apt-get clean;
COPY .zshrc /root/.zshrc
WORKDIR /root
ENV USER=root
CMD [ "zsh" ]
