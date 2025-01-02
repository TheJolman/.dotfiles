{...}: {
  imports = [
    ./wm/default.nix
    ./nixvim/default.nix
    ./scripts/default.nix
    ./shell/default.nix
    ./direnv.nix
    ./fuzzel.nix
    ./kitty.nix
    ./mako.nix
    ./git.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    # ./zed.nix
    ./vscode.nix
    ./nix-ld.nix
  ];
}
