{ config, pkgs, lib, ... }:

{
  home.username = "josh";
  home.homeDirectory = "/home/josh";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ../../modules/home/neovim/home.nix
    ../../modules/home/zsh.nix
    ../../modules/home/fuzzel.nix
    ../../modules/home/kitty.nix

  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # cli tools
    git
    curl
    fzf
    fastfetch
    lsd

    # dev stuff
    gnumake
    python3
    rstudio

    # gui apps
    parted
    firefox
    gnome.nautilus
    nautilus-open-any-terminal # for nautilus
    zoom-us # unfree
    discord # unfree
    webcord # for discord screen sharing
    libreoffice-qt
    hunspell     # for spellcheck

    # Desktop experience stuff
    swaylock
    hyprpaper
    hypridle
    waybar
    eww          # unused
    catppuccin   # unused

    # Essential tools for wm
    wl-clipboard
    grim
    slurp
    networkmanagerapplet
    polkit_gnome # for authentication dialogs
    brightnessctl
    swaynotificationcenter


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DejaVuSansMono" "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark_v2";
      vim_keys = true;
    };
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "zoom"
    "discord"
  ];


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
  home.sessionVariables = {
    EDITOR = "nvim";
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
