{ pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ./bash-extra.sh;
  };
}