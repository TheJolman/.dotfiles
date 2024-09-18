{pkgs, lib, ...}: {

  services.swayidle = {
    enable = true;
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
    # timeouts = [
    #   { 
    #     timeout = 300;
    #     command = "${pkgs.swaylock}/bin/swaylock -f"; 
    #   }
    # ];
  };
}
