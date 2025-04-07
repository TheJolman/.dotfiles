{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.default
    ./networking.nix
    ./mysql.nix
    ./printing.nix
    ./agenix.nix
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
    ./gaming.nix
    ./logind.nix
    ./vmware.nix
    ./wireshark.nix
  ];
}
