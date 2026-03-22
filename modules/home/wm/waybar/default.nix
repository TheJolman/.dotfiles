{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = [
          "tray"
          "idle_inhibitor"
          "network"
          "wireplumber"
          "cpu"
          "memory"
          "battery"
          "custom/notification"
        ];

        # "custom/logo" = {
        #   format = "";
        # };

        clock = {
          format = "{:%a, %d. %b  %H:%M:%S}";
          interval = 1;
        };

        "hyprland/workspaces" = {
          active-only = false;
        };

        "hyprland/window" = {
          max-length = 100;
          separate-outputs = true;
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };

        wireplumber = {
          format-muted = " ";
          format-icons = [" " " " " "];
          format = "{icon} {volume}%";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          on-click-right = "pavucontrol";
          escape = true;
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
          interval = 10;
          tooltip = "Usage: {usage}%";
          format = "  {avg_frequency} GHz";
        };

        memory = {
          interval = 30;
          tooltip = "{used} GiB / {total} GiB, {percentage}%";
          format = "  {used} GiB";
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
          format = "{icon} {capacity}%";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{} {icon}";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t";
          on-click-right = "swaync-client -t";
          escape = true;
        };
      };
    };
    style = builtins.readFile ./waybar.css;
  };
}
