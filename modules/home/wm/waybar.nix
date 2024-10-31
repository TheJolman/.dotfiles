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

        wireplumber = {
          format = "{node_name} {volume}%";

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
    # TODO Style this thang
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
	/*
    color: #f8f8f2;
	background: #282a36;
    */
    color: transparent;
	background: transparent;
}

#workspaces {
	margin-top: 8px;
	margin-left: 12px;
	margin-bottom: 0;
	border-radius: 26px;
	background: #282a36;
	transition: none;
}

#workspaces button {
	transition: none;
	color: #f8f8f2;
	background: transparent;
	font-size: 16px;
}

#workspaces button.focused {
	color: #9aedfe;
}

#workspaces button:hover {
	transition: none;
	box-shadow: inherit;
	text-shadow: inherit;
	color: #ff79c6;
}

#wireplumber {
	margin-top: 8px;
	margin-left: 8px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	background: #282a36;
	transition: none;
	color: #4d4d4d;
	background: #5af78e;
}

#mpd.disconnected,
#mpd.stopped {
	color: #f8f8f2;
	background: #282a36;
}

#network {
	margin-top: 8px;
	margin-left: 8px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	transition: none;
	color: #4d4d4d;
	background: #bd93f9;
}

#pulseaudio {
	margin-top: 8px;
	margin-left: 8px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	transition: none;
	color: #4d4d4d;
	background: #9aedfe;
}

#temperature {
	margin-top: 8px;
	margin-left: 8px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	transition: none;
	color: #4d4d4d;
	background: #5af78e;
}

#cpu {
	margin-top: 8px;
	margin-left: 8px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	transition: none;
	color: #4d4d4d;
	background: #f1fa8c;
}

#memory {
	margin-top: 8px;
	margin-left: 8px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	transition: none;
	color: #4d4d4d;
	background: #ff6e67;
}

#clock {
	margin-top: 8px;
	margin-left: 8px;
	margin-right: 12px;
	padding-left: 16px;
	padding-right: 16px;
	margin-bottom: 0;
	border-radius: 26px;
	transition: none;
	color: #f8f8f2;
	background: #282a36;
}

    '';
  };
}
