{ lib, pkgs, ... }:
{
  # https://github.com/rycee/home-manager/pull/829
  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "swaylock"; }
      { timeout = 600; command = "systemctl suspend"; }
    ];
    events = [
      { event = "before-sleep"; command = "swaylock -fF"; }
      { event = "lock"; command = "lock"; }
    ];
  };
}
