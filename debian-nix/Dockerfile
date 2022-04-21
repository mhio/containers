FROM me/debian-interactive:11
ARG NIX_VERSION=2.8.0
ARG NIX_VERSION_SHA=0b32afd8c9147532bf8ce8908395b1b4d6dde9bedb0fcf5ace8b9fe0bd4c075c
RUN set -uex; \
    groupadd nixbld;\
    useradd nix --create-home --home-dir /home/nix --groups nixbld;\
    mkdir -m 0755 /nix;\
    chown nix /nix;\
    curl -L https://releases.nixos.org/nix/nix-${NIX_VERSION}/nix-${NIX_VERSION}-x86_64-linux.tar.xz > /tmp/nix-${NIX_VERSION}-x86_64-linux.tar.xz;\
    xz -dc /tmp/nix-${NIX_VERSION}-x86_64-linux.tar.xz | tar -C /tmp -xf -;
ENV USER=nix
USER nix
WORKDIR /home/nix
RUN set -uex; \
    /tmp/nix-${NIX_VERSION}-x86_64-linux/install --no-daemon;\
    echo '[ -f ~/.profile ] && . ~/.profile' >> /home/nix/.bashrc;


