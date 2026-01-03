{user, ...}: {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ../../modules/home/shell/zsh.nix
    ../../modules/home/direnv.nix
    ../../modules/home/git.nix
    ../../modules/home/nixvim/default.nix
    ../../modules/home/catppuccin.nix
    ../../modules/home/fzf.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
