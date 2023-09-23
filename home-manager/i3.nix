{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;
    windowManager.i3 = rec {
      enable = true;
      package = pkgs.i3-gaps;
    #   config = {
    #     modifier = "Mod4";
    #     bars = [ ]; # use polybar instead

    #     gaps = {
    #       inner = 12;
    #       outer = 5;
    #       smartGaps = true;
    #       smartBorders = "off";
    #     };

    #     startup = [
    #       { command = "exec firefox"; }
    #       # allow polybar to resize itself
    #       { command = "systemctl --user restart polybar"; always = true; notification = false; }
    #     ];
    #     assigns = {
    #       "2: web" = [{ class = "^Firefox$"; }];
    #       # "4" = [{ class = "^Steam$"; }];
    #       # "6" = [{ class = "HexChat$"; }];
    #       # "7" = [{ class = "^Discord$"; }];
    #     };

    #     keybindings = import ./i3-keybindings.nix config.modifier;
    #   };
    #   extraConfig = ''
    #     for_window [class="^.*"] border pixel 2
    #     workspace "2: web" output HDMI-0
    #     workspace "7" output HDMI-0
    #   '';
    };
  };

  # home.file.".config/polybar/pipewire.sh" = {
  #   source = pkgs.callPackage ./polybar.nix { };
  #   executable = true;
  # };

  # services.polybar = {
  #   enable = true;
  #   # package = pkgs.polybarFull;
  #   # # config = pkgs.substituteAll {
  #   # #   src = ./polybar-config;
  #   # #   #interface = networkInterface;
  #   # # };
  #   # script = ''
  #   #   for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
  #   #     export MONITOR="$m"
  #   #     polybar nord &
  #   #   done
  #   # '';
  # };
}
