{inputs, ...}: {
  imports = [
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
  ];
  services.fwupd.enable = true;
}
