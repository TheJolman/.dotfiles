{pkgs, lib, ...}: {

  services.swayidle = {
    enable = true;
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

  options = {
    idleBehavior.enable =
      lib.mkEnableOption "enables locking and sleeping on idle";
  };

  config = {
    services.swayidle.timeouts = [
      { 
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f"; 
      }
    ];
  };
}
