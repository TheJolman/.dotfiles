{
  config,
  pkgs,
  ...
}: {
  boot.plymouth.enable = true; # For silent boot

  boot.loader = {
    efi = {canTouchEfiVariables = true;};
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      # catppuccin.enable = true;

      devices = ["nodev"];
    };
  };
}
