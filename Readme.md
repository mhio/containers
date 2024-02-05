# Containers

Builds debian 12 based containers. 

[node](https://nodejs.org/),
[deno](deno.land),
[nix](https://nixos.org/),
[zsh](https://www.zsh.org/),
[Nushell](https://github.com/nushell/nushell),
[ntfy](https://github.com/binwiederhier/ntfy),
[Commafeed](https://github.com/Athou/commafeed)

Build with
```
./mash build
```

Creates the following tags
```
me/debian
me/debian-base:12         me/debian-base:latest

debi
me/debian-interactive:12  me/debian-interactive:latest

me/debian-nix:12          me/debian-nix:latest

me/debian-zsh:12          me/debian-zsh:latest

me/debian-deno:12         me/debian-deno:latest 

me/debian-node:18         me/debian-node:latest 

me/ntfy:n.n.n             me/ntfy:latest 

me/commafeed:n.n.n        me/commafeed:latest 

me/nushell:n.n.n          me/nushell:latest
```

Version at #5fff6b48

- node 20.11.0
- deno 1.40.3
- ntfy 2.8.0
- commafeed 4.2.1
- nushell 0.89.0
- nix 2.20.1
