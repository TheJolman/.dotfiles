{...}: {
  imports = [
    ./wm/default.nix
    ./nixvim/default.nix
    ./scripts/default.nix
    ./shell/default.nix
    ./devtools
    # ./zed/default.nix
    # ./vscode/default.nix
    ./direnv.nix
    ./kitty.nix
    ./git.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    # ./nix-ld.nix
    # inputs.agenix.nixosModules.default
  ];
}
