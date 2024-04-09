{ config, lib, pkgs, ... }:

{
  programs.gpg-agent = {
    enable = true;
    enableSSHSupport = true;
    defaultCacheTtl = 60 * 60 * 4;
    maxCacheTtl = 60 * 60 * 24;

  };
}
