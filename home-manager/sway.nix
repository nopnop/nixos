{ config, lib, pkgs, ... }:
let
  colorScheme = import ../color-scheme/catppuccin.nix;
  background = ../home/noj/Pictures/Wallpapers/nova2023.png;
in
{
  imports = [
    ./swayidle.nix
  ];

  # Enable swaylock
  programs.swaylock = {
    enable = true;
    settings = {
      color = colorScheme.base;
      # ring-color = colorScheme.rosewater;
      # line-color = colorScheme.lavender;
      # text-color = colorScheme.text;
      # inside-color = colorScheme.base;
      # key-hl-color = colorScheme.rosewater;
      # ring-width = 3;
      # line-width = 3;
      # text-size = 20;
      ignore-empty-password = true;
      daemonize = true;
      image = "${background}";

    };
  };

  home = {
    file = {
      ".config/sway/background.png".source = background;
    };
  };

  # Enable the wayland window manager sway
  # See https://codeberg.org/annaaurora/home-manager-config/src/branch/main/users/default/sway/default.nix
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

      # bars = [ ];


      fonts = {
        names = [ "Roboto" ];
        style = "Regular Bold";
        size = 9.0;
      };

      colors = {
        focused = {
          border = colorScheme.lavender;
          background = colorScheme.base;
          text = colorScheme.text;
          indicator = colorScheme.rosewater;
          childBorder = colorScheme.lavender;
        };
        focusedInactive = {
          border = colorScheme.overlay0;
          background = colorScheme.base;
          text = colorScheme.text;
          indicator = colorScheme.rosewater;
          childBorder = colorScheme.overlay0;
        };
        unfocused = {
          border = colorScheme.overlay0;
          background = colorScheme.base;
          text = colorScheme.text;
          indicator = colorScheme.rosewater;
          childBorder = colorScheme.overlay0;
        };
        urgent = {
          border = colorScheme.peach;
          background = colorScheme.base;
          text = colorScheme.peach;
          indicator = colorScheme.overlay0;
          childBorder = colorScheme.peach;
        };
        placeholder = {
          border = colorScheme.overlay0;
          background = colorScheme.base;
          text = colorScheme.text;
          indicator = colorScheme.overlay0;
          childBorder = colorScheme.overlay0;
        };
        background = colorScheme.base;
      };



      startup = [
        # Launch Chrome on start
        # { command = "google-chrome-stable"; }

        # Status bar: waybar
        { command = "waybar"; }
        # Notification daemon
        # { command = "mako"; }
        # Polkit
        # { command =  "/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1"; }
        # # Idle
        # { command = "$HOME/.config/sway/idle.sh"; }
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

       output = {
        "*" = { bg = "${background} fill #1d2021"; };
       };



      # Remoe the titlebar
      window.titlebar = false;

      # Enable auto back and forth between workspaces: redo the last navigation to switch to the previous workspaceS
      workspaceAutoBackAndForth = true;

      # Extends the default keybindings with mkOptionDefault
      keybindings = lib.mkOptionDefault {
        # Launcher & apps
        "${modifier}+Alt+Space" = lib.mkForce "exec ${pkgs.ulauncher}/bin/ulauncher";
        "${modifier}+Shift+Return" = "exec ${pkgs.google-chrome}/bin/google-chrome-stable";
        "${modifier}+Shift+n" = "exec nautilus";
  
        # Screenshot on print key
        "${modifier}+Print" = "exec sh -c 'grim -g \"\$(slurp)\" - | swappy -f -'";
        

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

        # Move workspace around
        "${modifier}+Ctrl+Shift+Left" = "move workspace to output left";
        "${modifier}+Ctrl+Shift+Right" = "move workspace to output right";
        "${modifier}+Ctrl+Shift+Up" = "move workspace to output up";
        "${modifier}+Ctrl+Shift+Down" = "move workspace to output down";


        # Lock / suspend / hibernate
        "${modifier}+Escape" = "exec ${pkgs.swaylock}/bin/swaylock";
        "${modifier}+Shift+Escape" = "exec sh -c '${pkgs.swaylock}/bin/swaylock && systemctl suspend'";
        "${modifier}+Ctrl+Shift+Escape" = "exec sh -c '${pkgs.swaylock}/bin/swaylock && systemctl hibernate'";


        # Brightness
        "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 10";
        "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 10";


        # Toggle deafen
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        # Toggle mute
        "XF86AudioMute+Ctrl" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle && ffmpeg -y -f lavfi -i 'sine=frequency=200:duration=0.1' /tmp/sound.ogg && play /tmp/sound.ogg";
        # Raise sink (speaker, headphones) volume
        "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +2%";
        # Lower sink (microphone) volume
        "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -2%";
        # Spotify
        ## Play/pause spotify
        "XF86AudioPlay" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";
        ## Play previous spotify track
        "XF86AudioPrev" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";
        "XF86Launch5" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous";
        ## Play next spotify track
        "XF86AudioNext" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";
        "XF86Tools" = "exec dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next";
      };

    };


  };
  home.packages = with pkgs; [
    ulauncher
  ];
}
