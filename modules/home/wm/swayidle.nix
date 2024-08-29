{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      { 
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f"; 
      }
      # {
      #   timeout = 600;
      #   command = "${pkgs.systemd}/bin/systemctl suspend";
      # }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      # {
      #   event = "after-resume";
      #   command = "";
      # }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };
}
