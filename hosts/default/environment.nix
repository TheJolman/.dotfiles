{ config, pkgs, ... }:
{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

}
