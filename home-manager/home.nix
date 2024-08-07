# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:

    # Bha..
    ./bash.nix

    # The fast, feature-rich, GPU based terminal emulator
    ./kitty.nix

    # Bash prompt with super-power
    ./starship.nix

    # Window manager
    ./sway.nix
    ./waybar.nix

    # Security stuff, GPG / SSH / Yubikey & Co.
    ./gpg-agent.nix

    # Dev stuff
    ./git.nix


    # Nova devops profile:
    inputs.nova.hmProfiles.standard
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "jponchon";
    homeDirectory = "/home/jponchon";
    sessionVariables = {
      # Session variable are not well handled by home-manager (!? )
      # So I use some trick in bash-extra.sh to set them.
      # 
      # Basically, this will add them properly in ~/.profile 
      # but somehow, they are removed in non-login shell afterward.

      # See:
      #  - https://discourse.nixos.org/t/home-manager-doesnt-seem-to-recognize-sessionvariables/8488/20

      # Set the default editor
      EDITOR = "nvim";
      VISUAL = "nvim";
      # Set the default browser
      BROWSER = "google-chrome-stable";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    htop
    nil
    nixpkgs-fmt
    vlc
    xdg-utils
    openssl

    # Grim and slurp are used to take screenshots
    grim
    slurp
    swappy

    # Edition and drawing program:
    drawing
    xournal
    krita
    shutter
    inkscape

    # Yubikey
    # see too https://nixos.wiki/wiki/Yubikey
    yubikey-manager
    yubikey-manager-qt

    # Password manager
    pass
    sops

    # Disk utiilies
    dua
    duf

    # Dev utilities
    just
    deno
    nodejs_20
    prefetch-npm-deps # To compute package-lock.json sha256
    podman
    podman-compose
    docker-compose
    lazydocker
    lazygit
    jq
    xclip
    sqlite
    # (lib.lowPrio awscli)

    # Terminal utilities
    thefuck
    tldr
    browsh # Browser
    ripgrep # rg
    sd # Simpler sed
    fd # Simpler find
    rlwrap # Proper readline wrap with history (usfull for sqlite)
    # direnv

    # Sytem utilities
    btop
    wdisplays # Manage display

    # Audio
    pulseaudio
    alsa-utils
    pavucontrol

    # Networking
    croc # Move file around
  ];

  programs.gpg.enable = true;
  programs.firefox.enable = true;
  programs.google-chrome.enable = true;
  programs.vscode.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.spotify-player = {
    enable = true;
    settings = {
      cover_img_width = 10;
      cover_img_length = 18;
    };
  };

  programs.direnv.enable = true;


  programs.ssh.enable = true;
  services.ssh-agent.enable = true;

  # A command line tool which helps you navigate faster by learning your habits ⚡e
  # https://github.com/skywind3000/z.lua
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/z-lua.nix
  programs.z-lua = {
    enable = true;
    options = [ "enhanced" "once" "fzf" ];
  };

  # Blazing fast terminal file manager written in Rust, based on async I/O.
  programs.yazi.enable = true;

  # A highly configurable and lightweight notification daemon.
  # services.dunst.enable = true; # Replaced by swaync

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Start gnome-keyring-daemon
  # services.gnome-keyring.enable = true;

  # Flameshot does not work with sway but there is some workaround to explore
  # See https://forum.garudalinux.org/t/flameshot-not-working-in-sway-typing-flameshot-gui-hangs-in-the-terminal/24070/8
  # in the meantime consider using grim and slurp
  services.flameshot.enable = true;


  # Enable the PolicyKit Authentication Agent
  # https://wiki.archlinux.org/index.php/Polkit#Authentication_agents
  # This seems involved in susped/resume effectivess.. (to be tested more)
  systemd.user.services.polkit-gnome = {
    Unit = {
      Description = "PolicyKit Authentication Agent";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  # Symlink a few hard-coded paths to the home directory:


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";

}
