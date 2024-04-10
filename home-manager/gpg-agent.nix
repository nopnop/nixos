{ config, lib, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 60 * 60 * 4;
    maxCacheTtl = 60 * 60 * 24;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
