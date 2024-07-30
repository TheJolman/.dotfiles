{
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ../../modules/home/default.nix
    inputs.nixvim.homeManagerModules.nixvim
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    pointerCursor.enable = true;
  };

  xdg.enable = true;
  gtk = {
    enable = true;
    catppuccin = {
      # accent = "pink";
      flavor = "mocha";
      tweaks = ["normal"];
      icon.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   x11.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibta-Modern-Classic";
  #   size = 25;
  # };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    kitty
  ];

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/josh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {EDITOR = "nvim";};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
