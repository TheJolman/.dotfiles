{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkOption
    types
    ;
  cfg = config.wm.hypr;
in {
  imports = [
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
        Enables customized Hyprland DE.
      '';
    };
  };

  config = {
  };
}
