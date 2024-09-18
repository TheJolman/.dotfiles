{pkgs, lib, ...}: {

  services.swayidle = {
    enable = false;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      { 
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f"; 
      }
    ];
  };
}
