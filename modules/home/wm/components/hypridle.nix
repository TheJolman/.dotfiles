{...}: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300; # 5 mins
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 330; # 5.5 mins
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1800; # 30 mins
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
