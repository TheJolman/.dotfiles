{pkgs, lib, ...}: {

  options = {
    idleBehavior.enable =
      lib.mkEnableOption "enables locking and sleeping on idle";
  };

  config = {
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
  };
}
