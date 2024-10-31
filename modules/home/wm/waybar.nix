{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "network" "wireplumber" "cpu" "memory" "battery" ];

        clock = {
          format = "{:%a, %d. %b  %H:%M:%S}";
          interval = 1;
        };
        "hyprland/workspaces" = {
          active-only = false;
        };
      };
    };
    # TODO Style this thang
  };
}
