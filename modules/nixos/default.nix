{
  catppuccin,
  home-manager,
  ...
}: {
  imports = [
    catppuccin.nixosModules.catppuccin
    home-manager.nixosModules.default
    home-manager.nixosModules.home-manager
    ./networking.nix
    # ./mysql.nix
    ./printing.nix
    ./agenix.nix
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
  ];
}
