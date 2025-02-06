{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["custom/logo" "hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["tray" "network" "wireplumber" "battery" "cpu" "temperature" "memory"];

        "custom/logo" = {
          format = "";
        };

        clock = {
          format = "{:%a, %d. %b  %H:%M:%S}";
          interval = 1;
        };

        "hyprland/workspaces" = {
          active-only = false;
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        wireplumber = {
          format-muted = " ";
          format-icons = [" " " " " "];
          format = "{icon} {volume}%";
        };

        network = {
          tooltip = true;
          tooltip-format = "󰛶 {bandwidthUpBits} 󰱦 {bandwidthDownBits}";
          format-disconnected = "󰤮 ";
          format-icons = ["󰤯 " "󰤟 " "󰤢 " "󰤥 " "󰤨 "];
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀  {ipaddr}";
        };

        cpu = {
          tooltip = "{load}";
          format = "  {}%";
        };

        memory = {
          tooltip = "{used}";
          format = "  {}%";
        };

        temperature = {
          tooltip = false;
          thermal-zone = 0;
          critical-threshold = 80;
          format = " {temperatureC}󰔄 ";
          format-critical = " {temperatureC}󰔄 ";
          interval = 2;
        };

        battery = {
          format-icons = [" " " " " " " " " "];
          format = "{icon} {capacity}, {time}%";
        };
      };
    };
    style = builtins.readFile ./waybar.css;
  };
}
