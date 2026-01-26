{inputs, ...}: {
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    ./networking.nix
    ./amdgpu.nix
    # ./mysql.nix
    ./printing.nix
    # ./agenix.nix
    ./interception-tools.nix
    ./containers.nix
    ./bluetooth.nix
    ./boot.nix
    ./nh.nix
    # ./sddm.nix
    ./greetd.nix
    ./sound.nix
    ./systemd.nix
    ./services.nix
    ./common.nix
    ./gaming.nix
    ./logind.nix
    ./virtualisation.nix
    ./wireshark.nix
    ./mozillavpn.nix
    ./localsend.nix
    ./nix-ld.nix
  ];
}
