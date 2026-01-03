{user, ...}: {
  home.username = "${user}";
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    # ../../modules/home/shell/zsh.nix
    ../../modules/home/nixvim/default.nix
    ../../modules/home/catppuccin.nix
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
