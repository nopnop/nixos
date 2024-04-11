# Nixos config


Based on the nice [nix-starter-config](https://github.com/Misterio77/nix-starter-configs) from Misterio77.

This is my personal nixos configuration. Primarily it contain a laptop configuration with:

- [Home manager](https://github.com/nix-community/home-manager) - User space system management.
- [Sway](https://swaywm.org/) - Tiling window manager for wayland compositor?
- Gnome - To help when I struggle with gnome-specific tools
- [Kitty](https://sw.kovidgoyal.net/kitty/) - Terminal with unicorn features
- [Startship](https://starship.rs/) - Ultra customizable

And many other tools.

## References & useful links

- [nix-dev-home](https://github.com/juspay/nix-dev-home) - A getting started hm config 
- [gpg agent & ssh](https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3) - How to setup gpg + ssh
- [Yubikey + GPG + SSH](https://github.com/drduh/YubiKey-Guide?tab=readme-ov-file#passphrase) - Ultra detailed
- [Yubikey & GPG](https://support.yubico.com/hc/en-us/articles/360013790259-Using-Your-YubiKey-with-OpenPGP) - Using Your YubiKey with OpenPGP
- [Nixpkgs search](https://search.nixos.org/packages)


## Troubleshooting

### Update gpg-connect-agent

Ask me again for my password instead of failing:
`gpg-connect-agent updatestartuptty /bye`