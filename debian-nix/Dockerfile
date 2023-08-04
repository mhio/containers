FROM me/debian-base:12
ARG NIX_VERSION #=2.11.1
ARG NIX_VERSION_SHA #=c6d48479d50a01cdfc3669440776692ca7094ff29028b1fec6da0abeead16a01
RUN set -uex; \
    groupadd nixbld;\
    useradd nix --create-home --home-dir /home/nix --groups nixbld;\
    mkdir -m 0755 /nix;\
    chown nix /nix;\
    tarball="nix-${NIX_VERSION}-x86_64-linux.tar.xz";\
    curl -L "https://releases.nixos.org/nix/nix-${NIX_VERSION}/${tarball}" -o "/tmp/${tarball}";\
    shacheck=$(sha256sum -b "/tmp/${tarball}"); \
    printf "%s" "$shacheck" | grep -e "^${NIX_VERSION_SHA}\s";\
    xz -dc "/tmp/${tarball}" | tar -C /tmp -xf -;
ENV USER=nix
USER nix
WORKDIR /home/nix
RUN set -uex; \
    /tmp/nix-${NIX_VERSION}-x86_64-linux/install --no-daemon;\
    echo 'if [ -e /home/nix/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nix/.nix-profile/etc/profile.d/nix.sh; fi' >> ~/.bashrc;
RUN set -uex;\
    mkdir -p ~/.config/nix/;\
    touch ~/.config/nix/nix.conf;\
    . /home/nix/.nix-profile/etc/profile.d/nix.sh;\
    nix-shell -p curl -p jq;

#nix-channel --list
#echo 'binary-caches = http://acng/HTTPS///cache.nixos.org/' > ~/.config/nix/nix.conf;\
