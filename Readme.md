# Containers

Builds debian 12 based containers. 

[node](https://nodejs.org/),
[deno](deno.land),
[nix](https://nixos.org/),
[zsh](https://www.zsh.org/),
[Nushell](https://github.com/nushell/nushell),

Build with
```
./mash build
```

Creates the following tags
```
me/debian-base:12         me/debian-base:latest

me/debian-deno:12         me/debian-deno:latest 
me/debian-node:20         me/debian-node:latest 
me/debian-php:8.2         me/debian-php:latest 
me/debian-php:7.4
mh/vscode-reh:COMMIT_SHA
mh/vscodium-reh:VERSION

debi
me/debian-interactive:12  me/debian-interactive:latest
me/debian-nix:12          me/debian-nix:latest
me/debian-zsh:12          me/debian-zsh:latest
me/nushell:n.n.n          me/nushell:latest
```

## vscode/vscodium Remote Extension Host

node,php,golang build additional images with the vscode remote extensions hosts embedded for development


## Versions at #305d9d0b

```
NODE_VERSION="20.12.2"
DENO_VERSION="1.42.3"
GO_VERSION="1.22"
VSCODE_COMMIT="e170252f762678dec6ca2cc69aba1570769a5d39"
VSCODIUM_VERSION="1.88.1.24104"
NUSHELL_VERSION="0.92.2"
NIX_VERSION="2.21.2"
```
