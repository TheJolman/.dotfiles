{ config, pkgs, ... }:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      theme = /home/josh/.dotfiles/modules/nixos/grub/themes/catppuccin-macchiato-grub-theme;

      devices = [ "nodev" ];
    };
  };
}
