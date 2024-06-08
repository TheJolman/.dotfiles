{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      # { timeout = 30; command = "${pkgs.swaylock}/bin/swaylock -l"; }
      # {
      #   timeout = 60;
      #   command = "${pkgs.systemd}/bin/systemctl suspend";
      # }
      {
        timeout = 30;
        command = "swaylock -l";
      }
      {
        timeout = 60;
        command = "systemctl suspend";
      }
    ];
    events = [
      # { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -l"; }
      # { event = "after-resume"; command = "${pkgs.swaylock}/bin/swaylock -l"; }
      {
        event = "before-sleep";
        command = "";
      }
      {
        event = "after-resume";
        command = "";
      }
      {
        event = "lock";
        command = "";
      }
    ];
  };
}
