{ config, lib, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      
      # Use kitty as default terminal
      terminal = "kitty";

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
