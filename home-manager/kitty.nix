{ pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name =  "FiraCode Nerd Font" ;
      size = 9.0;
    };

    theme = "Catppuccin-Mocha";

  };
}
