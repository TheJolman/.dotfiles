{...}: {
  imports = [
    ./wm/default.nix
    ./nixvim/default.nix
    ./scripts/default.nix
    ./shell/default.nix
    # ./zed/default.nix
    # ./vscode/default.nix
    ./jupyter.nix
    ./direnv.nix
    ./kitty.nix
    ./git.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    # ./nix-ld.nix
    ./gemini.nix
    # inputs.agenix.nixosModules.default
  ];
}
