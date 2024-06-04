{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      # { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; }
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = [
      # { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -fF"; }
      # { event = "lock"; command = "lock"; }
    ];
  };
}
