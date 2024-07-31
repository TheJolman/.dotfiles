{...}: {
  imports = [
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
