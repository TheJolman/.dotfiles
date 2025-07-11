{pkgs, ...}: {
  imports = [
    ./wm/hypridle.nix
  ];

  wayland.windowManager.hyprland.settings.input.accel_profile = "adaptive";
  home.packages = with pkgs; [
    powertop
  ];
}
