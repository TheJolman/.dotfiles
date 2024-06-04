{
  config,
  lib,
  pkgs,
  ...
}: {
  services.dunst = {
    enable = true;
    catppuccin.enable = true;
  };
}
