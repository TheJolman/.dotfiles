{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops
    ./bluetooth.nix
    # ./greetd.nix
    ./grub.nix
    ./nh.nix
    ./sddm.nix
    ./sound.nix
    ./tlp.nix
    ./systemd.nix
    ./services.nix
    ./common.nix
    ./sops.nix
  ];
}
