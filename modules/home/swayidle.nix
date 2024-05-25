{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      { timeout = 600; command = "${pkgs.systemd}/bin/systemctl suspend"; }
    ];
  };
}
