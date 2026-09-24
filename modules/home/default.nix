{...}: {
  imports = [
    ./rider.nix
    ./hyprland
    ./nixvim
    ./scripts
    ./shell
    ./devtools
    ./zellij
    # ./zed
    # ./vscode
    ./direnv.nix
    # ./kitty.nix
    ./foot.nix
    ./git.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    # inputs.agenix.nixosModules.default
    ./fastfetch.nix
  ];
}
