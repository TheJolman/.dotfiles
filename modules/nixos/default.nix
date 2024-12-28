{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.default
    # inputs.sops-nix.nixosModules.sops
    ./interception-tools.nix
    ./docker.nix
    ./bluetooth.nix
    ./grub.nix
    ./nh.nix
    # ./sddm.nix
    ./greetd.nix
    ./sound.nix
    ./systemd.nix
    ./services.nix
    ./common.nix
    # ./sops.nix
    ./gaming.nix
    ./logind.nix
  ];
}
