{...}: {
  boot.plymouth.enable = false; # For silent boot

  boot.loader = {
    efi = {canTouchEfiVariables = true;};
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;

      devices = ["nodev"];
    };
  };
}
