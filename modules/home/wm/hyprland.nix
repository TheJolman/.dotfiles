{pkgs, ...}: let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    hyprpanel &
    ${pkgs.swayidle}/bin/swayidle &
    ${pkgs.dunst}/bin/dunst &
    nm-applet --indicator &
    blueman-applet &
    swww-daemon &  # wallaper daemon
    swww img ~/Pictures/Wallpapers/evening-sky.png &
  '';
in {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      exec-once = "${startupScript}/bin/start";

      env = ["HYPRCURSOR_THEME, phinger-cursors-dark" "HYPRCURSOR_SIZE, 25"];

      # to mirror, add the folowing to monitors list:
      # "DP-11,preferred,auto,1,mirror,eDP-1"
      monitor = [",preferred,auto,1"];

      "$mod" = "SUPER";

      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "fuzzel";
      "$browser" = "firefox";

      input = {
        kb_options = "caps:swapescape";
        accel_profile = "flat";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        layout = "dwindle";
        resize_on_border = true;

        "col.inactive_border" = "$surface0";
        "col.active_border" = "$sapphire";
      };

      group = {
        "col.border_active" = "$sapphire";
        "col.border_inactive" = "$surface0";
        groupbar = {
          "col.active" = "$sapphire";
          "col.inactive" = "rgb(7AA4B6)";
          text_color = "$surface1";
          font_size = 12;
          font_family = "FiraCode";
        };
      };

      decoration = {rounding = 15;};

      misc = {
        new_window_takes_over_fullscreen = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "windowsMove, 1, 7, myBezier"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile =
          true; # master switch for pseudotiling. Enabling is bound to mod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 300;
      };

      master = {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        # new_is_master = true;
      };

      windowrule = ["idleinhibit fullscreen, firefox"];

      windowrulev2 = ["bordercolor $yellow, fullscreen:1"];

      bind =
        [
          # apps
          "$mod, B,       exec, $browser"
          "$mod, Return,  exec, $terminal"
          "$mod, D,       exec, $menu"
          "$mod, E, 	    exec, $fileManager"
          "$mod, Q,       killactive"
          "$mod SHIFT, M, exit"
          "$mod SHIFT, L, exec, swaylock -f"

          # alt tab
          "ALT, Tab, cyclenext,"
          "ALT, TAB, bringactivetotop,"

          # screenshot a region
          ", PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"
          # screenshot a window
          "$mod, PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots"
          # screenshot a monitor
          "$mod SHIFT, PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"

          # window navigation
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

          "$mod, F, fullscreen, 1"
          "$mod SHIFT, F, fullscreen, 0"

          "$mod, V, togglefloating"
          "$mod, SHIFT J, togglesplit"

          # groups
          "$mod, G, togglegroup"
          "$mod, right, changegroupactive, f"
          "$mod, left, changegroupactive, b"
          "$mod SHIFT, left, moveintogroup, l"
          "$mod SHIFT, right, moveintogroup, r"
          "$mod SHIFT, up, moveintogroup, u"
          "$mod SHIFT, down, moveintogroup, d"

          "$mod, S, togglespecialworkspace, magic"
          "$mod SHIFT, S, movetoworkspace, special:magic"

          # media keys
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
          ", XF86AudioNext, exec, playerctl next"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (x: let
              ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ])
            10)
        );

      bindm = ["$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow"];

      bindl = [
        # lock when lid is closed
        ", switch:on:Lid Switch, exec, swaylock -f"
        # sleep system when switch is closed
        ", switch:on:Lid Switch, exec, systemctl suspend"

        # the below lines seem to make my bar dissapear when the lid is closed and opened

        # turn screen off when lid is closed
        # ''
        #   , switch:on:Lid Switch, exec, hyprctl keyword monitor "eDP-1, disable"''
        # turn back on when lid is opened
        # ''
        #   , switch:off:Lid Switch, exec, hyprctl keyword monitor "eDP-1, auto, 1"''
      ];
    };
  };
  programs.hyprcursor-phinger.enable = true;
}
