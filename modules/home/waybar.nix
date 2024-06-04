{
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
  };
}
