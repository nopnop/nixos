{ config, lib, pkgs, ... }:
let colorScheme = import ../color-scheme/catppuccin.nix;
in
{

  home.packages = with pkgs; [
    networkmanagerapplet
    pavucontrol
  ];

  # See <https://github.com/nix-community/home-manager/blob/master/modules/programs/waybar.nix>
  # see <https://github.com/Alexays/Waybar/wiki/Configuration>
  # see <https://github.com/Alexays/Waybar/wiki/Examples>
  programs.waybar = {
    enable = true;
    settings = {

      mainBar = {
        position = "bottom";
        height = 5;
        "modules-left" = [ "sway/workspaces" "sway/mode" "custom/media" ];
        "modules-center" = [ "sway/window" ];
        "modules-right" = [ "pulseaudio" "network" "backlight" "cpu" "memory" "battery" "clock" "custom/notification" "tray" ];
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            notification = " <span foreground='red'><sup></sup></span>";
            none = "  ";
            dnd-notification = " <span foreground='red'><sup></sup></span>";
            dnd-none = "  ";
            inhibited-notification = " <span foreground='red'><sup></sup></span>";
            inhibited-none = "  ";
            dnd-inhibited-notification = " <span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = " ; ";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };


        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          icon-size = 21;
          spacing = 10;
        };
        clock = {
          tooltip-format = "{:%Y-%m-%d | %H:%M}";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C ";
          format = "{temperatureC}°C ";
        };
        backlight = {
          # device = "acpi_video1";
          format = "{percent}% {icon}";
          states = [ 0 50 ];
          format-icons = [ "" "" ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          # format-good = ""; # An empty format will hide the module
          # format-full = "";
          format-icons = [ "" "" "" "" "" ];
        };

        network = {
          # interface = "wlp2s0"; # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
          format-disconnected = "Disconnected ⚠";
          interval = 7;
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };

        pulseaudio = {
          # scroll-step = 1;
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

      };
    };

    style = ./waybar.css;
  };
}

