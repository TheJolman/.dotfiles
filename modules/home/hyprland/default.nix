{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    types
    optionals
    ;
  cfg = config.thejolman.home.hyprland;

  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    waybar &
    nm-applet --indicator &
    blueman-applet &
    awww-daemon &  # wallaper daemon
    awww img ~/.dotfiles/images/cherry-6.png &
    upower-notify &
    ${pkgs.batsignal}/bin/batsignal &
  '';
in {
  imports = [
    ## Notifs Daemon
    ./swaync.nix
    ## Screen Locker
    ./hyprlock.nix
    ## Picker
    ./fuzzel.nix
    ## Bar
    ./waybar
    # ./hyprpanel.nix
    # ./ashell.nix
  ];

  options.thejolman.home.hyprland = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Enables customized Hyprland DE.
      '';
    };

    computerType = mkOption {
      type = types.enum ["desktop" "laptop"];
      default = "desktop";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;
      [
        awww
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

    catppuccin.hyprland.enable = false;

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      systemd.enableXdgAutostart = true;
      configType = "lua";
      extraConfig = builtins.readFile ./config.lua;
    };

    services.hypridle = lib.mkIf (cfg.computerType == "laptop") {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 200; #
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 300; # 5 mins
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 600; # 10 mins
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  }; # config
}
