{
  inputs,
  hyprpanel,
  ...
}: {
  imports = [hyprpanel.homeManagerModules.hyprpanel];

  programs.hyprpanel = {
    enable = true;
    systemd.enable = true;
    hyprland.enable = true;
    overwrite.enable = true;
  };
}
