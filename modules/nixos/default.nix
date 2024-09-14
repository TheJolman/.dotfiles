{inputs, lib, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops
    ./docker.nix
    ./kali-docker.nix
    ./bluetooth.nix
    ./grub.nix
    ./nh.nix
    # ./sddm.nix
    ./greetd.nix
    ./sound.nix
    ./tlp.nix
    ./systemd.nix
    ./services.nix
    ./common.nix
    # ./sops.nix
    ./gaming.nix

  ];

  gaming.enable =
    lib.mkDefault false;
}
