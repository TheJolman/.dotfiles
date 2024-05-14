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
      theme = ./themes/catppuccin-macchiato-grub-theme/theme.txt;

      devices = [ "nodev" ];
    };
  };
}
