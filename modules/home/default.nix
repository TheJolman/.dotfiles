{ config, lib, ...}: 
{
  imports = [
    ./gaming.nix
    ./wm/default.nix
    ./direnv.nix
    ./zsh.nix
    ./fuzzel.nix
    ./kitty.nix
    ./dunst.nix
    ./git.nix
    ./yazi.nix
    ./nixvim/default.nix
    ./packages.nix
    ./theming.nix
    ./btop.nix
    ./zed.nix
  ];

  gaming.enable = 
    lib.mkDefault false;

}
