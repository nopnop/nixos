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
    rnix-lsp
    nixpkgs-fmt
    xdg-utils
    vlc
    nil
  ];
  

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

  programs.git = {
    enable = true;
    userName = "Jean Ponchon";
    userEmail = "jean.ponchon@novadiscovery.com";
  };

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
  services.dunst.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";


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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";

}
