{lib, ...}: {
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprland.nix
    ./swayidle.nix
    ./swaylock.nix
    ./gbar.nix
  ];

  idleBehavior.enable = lib.mkDefault true;

}
