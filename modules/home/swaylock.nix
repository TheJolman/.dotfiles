{ config, pkgs, ... }:
{
  programs.swaylock = {
    enable = true;
    catppuccin.enable = true;

  };
}
