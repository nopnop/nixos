{ pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name =  "Roboto" ;
      size = 8.0;
    };
  };
}
