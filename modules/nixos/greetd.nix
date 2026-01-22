{pkgs, ...}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
in {
  environment.systemPackages = [pkgs.tuigreet];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  # thank you sjcobb2022
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
