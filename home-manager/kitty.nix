{ pkgs, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name =  "Roboto" ;
      size = 9.0;
    };
  };
}
