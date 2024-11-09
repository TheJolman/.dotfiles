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
        modules-right = [ "tray" "network" "wireplumber" "cpu" "memory" "temperature" "battery" ];

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
          format = "{node_name}: {volume}%";

        };

        network = {
          tooltip = false;
          format-wifi = "  {essid} {ipaddr}";
          format-ethernet ="{ipaddr}";
        };

        cpu = {
          tooltip = false;
          format = "CPU: {}%";
        };

        memory = {
          tooltip = false;
          format = "Mem: {}%";
        };
      };
    };
    style = ''

* {
    border: none;
    border-radius: 0;
    font-family: FiraCode Nerd Font;
    font-size: 14px;
    min-height: 24px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#window {
    margin-top: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 26px;
    transition: none;
    color: transparent;
    background: transparent;
}

#workspaces {
    margin-top: 8px;
    margin-left: 12px;
    margin-bottom: 0;
    border-radius: 26px;
    background: @base;
    transition: none;
}

#workspaces button {
    transition: none;
    color: @text;
    background: transparent;
    font-size: 16px;
}

#workspaces button.focused {
    color: @sky;
}

#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    color: @pink;
}


#tray,
#wireplumber,
#network,
#battery,
#temperature,
#cpu,
#memory,
#clock {
    margin-top: 8px;
    margin-left: 8px;
    padding-left: 16px;
    padding-right: 16px;
    margin-bottom: 0;
    border-radius: 26px;
    transition: none;
}

#clock {
    color: @text;
    background: @base;
}

#tray {
    color: @base;
    background: @peach;
}

#network {
    color: @base;
    background: @pink;
}

#temperature {
    color: @base;
    background: @mauve;
}

#wireplumber {
    color: @base;
    background: @lavender;
}

#cpu {
    color: @base;
    background: @flamingo;
}

#memory {
    padding-right: 16px;
    color: @base;
    background: @red;
}

#battery {
    margin-right: 12px;
    color: @base;
    background: @blue;
}

#mpd.disconnected,
#mpd.stopped {
    color: @text;
    background: @base;
}

    '';
  };
}
