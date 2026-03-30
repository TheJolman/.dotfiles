{user, ...}: {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/nixvim
    ../../modules/home/catppuccin.nix
    ../../modules/home/scripts
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
