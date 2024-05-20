{ pkgs, config, ... }:
{
  programs.yazi = {
    enable = true;
    catppuccin.enable = true;
    enableZshIntegration = true;
  };
}
