FROM me/debian-interactive:12

RUN set -uex;\
    apt-get update;\
    apt-get -y install zsh;\ 
    apt-get clean;
COPY .zshrc /root/.zshrc
WORKDIR /root
ENV USER=root
CMD [ "zsh" ]
