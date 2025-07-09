{...}: {
  programs.hyprpanel = {
    # TODO: configure screenshot, avatar
    enable = true;

    settings = {
      bar = {
        launcher.icon = "";
        clock.format = "%a %b %d  %H:%M:%S";
      };
      menus = {
        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = true;
          shortcuts.left.shortcut1 = {
            icon = "󰈹";
            tooltip = "Firefox";
            command = "firefox";
          };
          shortcuts.left.shortcut3.command = "vesktop";
          shortcuts.left.shortcut4.command = "fuzzel";
        };

        clock.time.military = true;
        clock.weather = {
          enabled = true;
          location = "Fullerton";
        };
      };

      theme = {
        bar.transparent = true;
        font.name = "CaskaydiaCove NF";
      };
    };
  };
}
