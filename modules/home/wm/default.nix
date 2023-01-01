{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.wm.hypr;
in {
  imports = mkIf cfg.enable [
    ./hyprlock.nix
    ./hyprland.nix
    ./waybar.nix
    ./fuzzel.nix
    ./swaync.nix
  ];

  options.wm.hypr = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = ''
        Enables customized Hyprland DE with complementary apps.
      '';

      computerType = mkOption {
        type = types.enum ["desktop" "laptop"];
        default = "desktop";
        description = ''
          Enables optimizations for the specified type of computer. For example, enables
          mouse accelearation and lid switch functionality for laptops.
        '';
      };
    };
  };

  config = {
    home.packages = with pkgs;
      [
        swww
        libnotify
        hyprcursor
        wl-clipboard
        hyprshot
        networkmanagerapplet
        polkit_gnome
        brightnessctl
        alsa-utils
        pavucontrol # Audio Control
        wl-mirror
      ]
      ++ optionals (cfg.computerType == "laptop") [
        acpi # Battery status
        upower
      ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      systemd.enableXdgAutostart = true;

      settings = {
        exec-once = "${startupScript}/bin/start";

        # to mirror, add the folowing to monitors list:
        # "DP-11,preferred,auto,1,mirror,eDP-1"
        monitor = [",highres@highrr,auto,1"];

        input.accel_profile =
          if cfg.computerType == "laptop"
          then "adaptive"
          else "flat";

        "$mod" = "SUPER";

        "$terminal" = "kitty";
        "$fileManager" = "nautilus";
        "$menu" = "fuzzel";
        "$browser" = "firefox";

        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 3;
          layout = "dwindle";
          resize_on_border = true;

          "col.inactive_border" = "$surface0";
          "col.active_border" = "$pink";
        };

        # pink with increased opacity -> rgba(f5c2e7A0)
        group = {
          "col.border_active" = "$pink";
          "col.border_inactive" = "$surface0";
          auto_group = false;
          groupbar = {
            "col.active" = "$pink";
            "col.inactive" = "$surface0";
            height = "18";
            text_color = "$text";
            font_size = 17;
            font_family = "CaskaydiaCove Nerd Font Propo";
          };
        };

        decoration = {
          rounding = 10;
          shadow = {
            enabled = false;
            range = 6;
            color = "$flamingo";
            color_inactive = "$surface0";
          };
        };

        misc = {
          font_family = "CaskaydiaCove Nerd Font Propo, Light";
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
          preserve_split = true; # you probably want this
        };

        gesture = [
          "3, horizontal, workspace"
        ];

        # Use `hyprctl clients` for window class/title info
        windowrule = [
          "idleinhibit fullscreen,class:(firefox)"
          "idleinhibit focus,title:(.*)(- Youtube)$"
          "bordercolor $red,fullscreen:1"
          "float,class:(org.gnome.Nautilus)"
        ];

        # e -> repeat, will repeat when held
        binde = [
          # move windows (tiled or floating)
          # "$mod SHIFT, h, movewindow, l"
          # "$mod SHIFT, l, movewindow, r"
          # "$mod SHIFT, k, movewindow, u"
          # "$mod SHIFT, j, movewindow, d"

          # move floating windows
          "$mod ALT, h, moveactive, -50 0"
          "$mod ALT, l, moveactive, 50 0"
          "$mod ALT, k, moveactive, 0 -50"
          "$mod ALT, j, moveactive, 0 50"

          # resize windows
          "$mod CTRL, h, resizeactive, -30 0"
          "$mod CTRL, l, resizeactive, 30 0"
          "$mod CTRL, k, resizeactive, 0 -30"
          "$mod CTRL, j, resizeactive, 0 30"

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
        ];

        bind =
          [
            # apps
            "$mod, B,       exec, $browser"
            "$mod, Return,  exec, $terminal"
            "$mod, D,       exec, $menu"
            "$mod, E,       exec, $fileManager"
            "$mod, Q,       killactive"
            "$mod CTRL, M, exit"
            "$mod CTRL, A, exec, hyprlock"
            "$mod CTRL, S, exec, systemctl hibernate"

            # alt tab
            "ALT, Tab, cyclenext,"
            "ALT, TAB, bringactivetotop,"

            # screenshot a region
            "     , PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"
            "SHIFT, PRINT, exec, hyprshot -m region --clipboard-only"
            # screenshot active window
            "ALT      , PRINT, exec, hyprshot -m active -m window -o ~/Pictures/Screenshots"
            "ALT SHIFT, PRINT, exec, hyprshot -m active -m window --clipboard-only"
            # screenshot active monitor
            "$mod      , PRINT, exec, hyprshot -m active -m output -o ~/Pictures/Screenshots"
            "$mod SHIFT, PRINT, exec, hyprshot -m active -m output --clipboard-only"

            # window navigation
            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"

            "$mod, n, workspace, +1"
            "$mod, p, workspace, -1"

            # window manipulation
            "$mod, F, fullscreen, 1"
            "$mod SHIFT, F, fullscreen, 0"

            "$mod, V, togglefloating"
            "$mod, i, togglesplit"
            "$mod, o, swapsplit"

            # dwindle

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

        # m -> mouse
        bindm = ["$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow"];

        # l -> locked, will also work when an input inhibitor (like a lockscreen) is active
        bindl = [
          # turn laptop display off when lid is closed
          ", switch:on:Lid Switch, exec, hyprctl keyword monitor eDP-1, disable"
          # turn laptop display on when lid is opened
          ", switch:off:Lid Switch, exec, hyprctl keyword monitor eDP-1, enable"
          ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"
          "$mod CTRL, M, exit"
          "$mod CTRL, S, exec, systemctl hibernate"
        ];
      };
    };
  };
}
