{ config, lib, pkgs, ... }:
let
  opacity = "E5";
in
{
  services.dunst = {
    enable = true;
    # configFile = "${config.xdg.cacheHome}/wallust/dunstrc";
  };

  # this is stolen from someone else
  #custom.wallust.templates.dunstrc = lib.mkIf config.services.dunst.enable {

  #    urgency_critical = {
  #      background = "{{color1}}";
  #      foreground = "{{foreground}}";
  #      timeout = 0;
  #    };

  #    urgency_low = {
  #      background = "{{background}}${opacity}";
  #      foreground = "{{foreground}}";
  #      timeout = 10;
  #    };

  #    urgency_normal = {
  #      background = "{{background}}${opacity}";
  #      foreground = "{{foreground}}";
  #      timeout = 10;
  #    };
  #  };
  #  target = "${config.xdg.cacheHome}/wallust/dunstrc";
  #};
}
