FROM me/debian-interactive:11
RUN set -uex; \
    groupadd nixbld;\
    useradd nix --create-home --home-dir /home/nix --groups nixbld;\
    mkdir -m 0755 /nix;\
    chown nix /nix;\
    curl -L https://releases.nixos.org/nix/nix-2.7.0/nix-2.7.0-x86_64-linux.tar.xz > /tmp/nix-2.7.0-x86_64-linux.tar.xz;\
    xz -dc /tmp/nix-2.7.0-x86_64-linux.tar.xz | tar -C /tmp -xf -;
ENV USER=nix
USER nix
WORKDIR /home/nix
RUN set -uex; \
    /tmp/nix-2.7.0-x86_64-linux/install --no-daemon;\
   echo '[ -f ~/.profile ] && . ~/.profile' >> /home/nix/.bashrc;\
   echo '[ -f ~/.profile ] && . ~/.profile' >> /home/nix/.zshrc;

CMD [ "zsh" ]

