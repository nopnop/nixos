{ config, lib, pkgs, ... }:
let colorScheme = import ../color-scheme/catppuccin.nix;
in
{
  # See <https://github.com/nix-community/home-manager/blob/master/modules/programs/waybar.nix>
  # see <https://github.com/Alexays/Waybar/wiki/Configuration>
  # see <https://github.com/Alexays/Waybar/wiki/Examples>
  programs.waybar = {
    enable = true;
    # settings = {
    #   mainBar = {
    #     "custom/notification" = {
    #       tooltip = false;
    #       format = "{icon}";
    #       format-icons = {
    #         notification = "<span foreground='red'><sup></sup></span>";
    #         none = "";
    #         dnd-notification = "<span foreground='red'><sup></sup></span>";
    #         dnd-none = "";
    #         inhibited-notification = "<span foreground='red'><sup></sup></span>";
    #         inhibited-none = "";
    #         dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
    #         dnd-inhibited-none = ";";
    #       };
    #       return-type = "json";
    #       exec-if = "which swaync-client";
    #       exec = "swaync-client -swb";
    #       on-click = "swaync-client -t -sw";
    #       on-click-right = "swaync-client -d -sw";
    #       escape = true;
    #     };
    #   };
    # };
  };
}

