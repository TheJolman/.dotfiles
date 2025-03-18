{...}: {
  imports = [
    ./rider.nix
    ./jupyter.nix
    ./wm/default.nix
    ./nixvim/default.nix
    ./scripts/default.nix
    ./shell/default.nix
    ./zed/default.nix
    ./direnv.nix
    ./fuzzel.nix
    ./kitty.nix
    ./mako.nix
    ./git.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    ./vscode.nix
    ./nix-ld.nix
  ];
}
