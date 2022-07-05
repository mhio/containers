FROM me/debian-interactive:11
ARG NIX_VERSION=2.9.2
ARG NIX_VERSION_SHA=e5fd4e993bc6c565aa0544eec2db6a977e496896f4133002436b1be1d3e9a8f6
RUN set -uex; \
    groupadd nixbld;\
    useradd nix --create-home --home-dir /home/nix --groups nixbld;\
    mkdir -m 0755 /nix;\
    chown nix /nix;\
    tarball="nix-${NIX_VERSION}-x86_64-linux.tar.xz";\
    curl -L "https://releases.nixos.org/nix/nix-${NIX_VERSION}/${tarball}" -o "/tmp/${tarball}";\
    sha256sum -b "/tmp/${tarball}" | grep -e "^${NIX_VERSION_SHA}\s";\
    xz -dc "/tmp/${tarball}" | tar -C /tmp -xf -;
ENV USER=nix
USER nix
WORKDIR /home/nix
RUN set -uex; \
    /tmp/nix-${NIX_VERSION}-x86_64-linux/install --no-daemon;\
    echo '[ -f ~/.profile ] && . ~/.profile' >> /home/nix/.bashrc;


