{ config, lib, pkgs, ... }:
let
  colorScheme = import ../color-scheme/catppuccin.nix;
in
{
  programs.waybar = {
    enable = true;
  

  };
}
