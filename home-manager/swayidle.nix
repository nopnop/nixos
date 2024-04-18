{ lib, pkgs, ... }:
{
  # https://github.com/rycee/home-manager/pull/829
  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 360; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
    events = [
      { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      # { event = "lock"; command = "lock"; }
    ];
  };
}
