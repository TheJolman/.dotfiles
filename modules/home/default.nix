{...}: {
  imports = [
    ./wm
    ./nixvim
    ./scripts
    ./shell
    ./devtools
    # ./zed
    # ./vscode
    ./direnv.nix
    ./kitty.nix
    ./git.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    # inputs.agenix.nixosModules.default
  ];
}
