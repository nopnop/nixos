{ config, lib, pkgs, ... }:
let
  colorScheme = import ../color-scheme/campbell.nix;
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";

      # Use kitty as default terminal
      terminal = "kitty";

      gaps = {
        smartBorders = "on";
        smartGaps = true;
      };
      floating.border = 1;
      window.border = 1;
      bars = [ ];
      colors = {
        focused = {
          background = colorScheme.green;
          border = colorScheme.greenBright;
          childBorder = colorScheme.green;
          indicator = colorScheme.green;
          text = colorScheme.black;
        };
        focusedInactive = {
          background = colorScheme.yellow;
          border = colorScheme.yellowBright;
          childBorder = colorScheme.yellow;
          indicator = colorScheme.yellow;
          text = colorScheme.black;
        };
        unfocused = {
          background = colorScheme.magenta;
          border = colorScheme.magentaBright;
          childBorder = colorScheme.magenta;
          indicator = colorScheme.magenta;
          text = colorScheme.black;
        };
        urgent = {
          background = colorScheme.red;
          border = colorScheme.redBright;
          childBorder = colorScheme.red;
          indicator = colorScheme.red;
          text = colorScheme.black;
        };
        background = colorScheme.black;
      };
      fonts = {
        names = [ "Roboto" ];
        style = "Regular Bold";
        size = 12.0;
      };


      startup = [
        # Launch Chrome on start
        { command = "google-chrome-stable"; }
      ];

      input = {
        "*" = {
          xkb_layout = "fr";
          xkb_variant = "nodeadkeys";
          xkb_options = "grp:alt_shift_toggle";
          xkb_numlock = "enable";
        };
        "1267:12866:VEN_04F3:00_04F3:3242_Touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          tap_button_map = "lrm";
          click_method = "clickfinger";
        };
      };


      # Remoe the titlebar
      window.titlebar = false;

      # Enable auto back and forth between workspaces: redo the last navigation to switch to the previous workspaceS
      workspaceAutoBackAndForth = true;

      # Extends the default keybindings with mkOptionDefault
      keybindings = lib.mkOptionDefault {
        # Add keybindings for french keyboard layout
        "${modifier}+ampersand" = "workspace number 1";
        "${modifier}+eacute" = "workspace number 2";
        "${modifier}+quotedbl" = "workspace number 3";
        "${modifier}+apostrophe" = "workspace number 4";
        "${modifier}+parenleft" = "workspace number 5";
        "${modifier}+minus" = "workspace number 6";
        "${modifier}+egrave" = "workspace number 7";
        "${modifier}+underscore" = "workspace number 8";
        "${modifier}+ccedilla" = "workspace number 9";
        "${modifier}+agrave" = "workspace number 10";

        "${modifier}+Shift+ampersand" = "move container to workspace number 1";
        "${modifier}+Shift+eacute" = "move container to workspace number 2";
        "${modifier}+Shift+quotedbl" = "move container to workspace number 3";
        "${modifier}+Shift+apostrophe" = "move container to workspace number 4";
        "${modifier}+Shift+parenleft" = "move container to workspace number 5";
        "${modifier}+Shift+minus" = "move container to workspace number 6";
        "${modifier}+Shift+egrave" = "move container to workspace number 7";
        "${modifier}+Shift+underscore" = "move container to workspace number 8";
        "${modifier}+Shift+ccedilla" = "move container to workspace number 9";
        "${modifier}+Shift+agrave" = "move container to workspace number 10";

        "${modifier}+Shift+Return" = "exec google-chrome-stable";
      };

    };


  };
}
