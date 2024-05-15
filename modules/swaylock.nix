{ pkgs, config, ... }:
{
  programs.swaylock = {
    enable = true;
    catppuccin.enable = true;
  };
}
