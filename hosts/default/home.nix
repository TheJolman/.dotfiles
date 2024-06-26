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
    ../../modules/home/zsh.nix
    ../../modules/home/fuzzel.nix
    ../../modules/home/kitty.nix
    ../../modules/home/dunst.nix
    ../../modules/home/swaylock.nix
    ../../modules/home/swayidle.nix
    ../../modules/home/git.nix
    ../../modules/home/yazi.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/nixvim/default.nix
    ../../modules/home/default.nix
    inputs.nixvim.homeManagerModules.nixvim
    inputs.catppuccin.homeManagerModules.catppuccin
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];

  catppuccin.enable = true;

  xdg.enable = true;
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      accent = "pink";
      tweaks = ["normal"];
      icon.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
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
    # cli tools
    curl
    fzf
    fastfetch
    lsd
    xorg.xhost
    parted
    polkit
    bat
    zip
    unzip

    # for secrets
    sops

    # dev stuff
    gnumake
    python312
    jdk
    clang
    git-credential-oauth
    gh

    # gui apps
    mediawriter
    gparted
    firefox
    gnome.nautilus
    nautilus-open-any-terminal # for nautilus
    zoom-us # unfree
    discord # unfree
    webcord # for discord screen sharing
    libreoffice-qt
    hunspell # for spellcheck
    vscode
    zed-editor
    evince # gnome document viewer
    gnome.eog # gnome image viwer

    # Desktop experience stuff
    swww
    waybar
    hyprcursor

    # Essential tools for wm
    swayidle
    wl-clipboard
    grim
    slurp
    hyprshot
    networkmanagerapplet
    polkit_gnome # for authentication dialogs
    brightnessctl
    alsa-utils
    pavucontrol

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override {
      fonts = ["FiraCode" "DejaVuSansMono" "FantasqueSansMono"];
    })

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
      vim_keys = true;
    };
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["zoom" "discord" "vscode" "steam-run" "steam-original"];

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
