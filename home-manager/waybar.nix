{ config, lib, pkgs, ... }:
let
  colorScheme = import ../color-scheme/catppuccin.nix;
in
{
  # See <https://github.com/nix-community/home-manager/blob/master/modules/programs/waybar.nix>
  # see <https://github.com/Alexays/Waybar/wiki/Configuration>
  # see <https://github.com/Alexays/Waybar/wiki/Examples>
  programs.waybar = {
    enable = true;
    # settings = { };
  };
}
