{...}: {
  programs.hyprpanel = {
    # TODO: configure screenshot, avatar
    enable = true;
    systemd.enable = false;

    settings = {
      bar = {
        launcher.icon = "";
        clock.format = "%a %b %d  %H:%M:%S";
        workspaces.numbers = true;
      };

      menus = {
        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = true;

          shortcuts = {
            left.shortcut1 = {
              icon = "󰈹";
              tooltip = "Firefox";
              command = "firefox";
            };
            left.shortcut3.command = "vesktop";
            left.shortcut4.command = "fuzzel";
          };
        };

        clock = {
          time.military = true;
          weather = {
            enabled = true;
            location = "Los Angeles";
          };
        };
      };

      theme = {
        bar.transparent = true;
        font.name = "CaskaydiaCove NF";
      };
    };
  };
}
