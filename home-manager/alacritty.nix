{ pkgs, lib, ... }:

let
  theme = ./alacritty-catppuccin_mocha.toml;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "${theme}"
      ];
      window = {
        opacity = 0.95;
      };
      font = {
        normal.family = "FiraCode Nerd Font";
        size = 9.0;
      };
    };


    # theme = "Catppuccin-Mocha";

  };
}
