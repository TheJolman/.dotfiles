{
  pkgs,
  config,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    catppuccin.enable = true;
  };
}
