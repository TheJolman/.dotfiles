{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.wm.components;
in {
  options.wm.components.ashell = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enables customized ashell.
      '';
    };
  };

  config = {
    programs.ashell = mkIf cfg.enable {
      enable = true;
      systemd.enable = true;
      settings = {
        modules = {
          left = ["Workspaces"];
          center = ["WindowTitle"];
          right = [["Tray" "SystemInfo"] ["Clock" "Privacy" "Settings" "Notifications"]];
        };
        CustomModule = [
          {
            name = "Notifications";
            icon = "";
            command = "swaync-client -t -sw";
            listen_cmd = "swaync-client -t -swb";
            icons."dnd.*" = "";
            alert = ".*notification";
          }
        ];
        appearance = {
          scale_factor = 1.1;
        };
      }; # settings
    }; # programs.ashell
  };
}
