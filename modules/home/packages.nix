{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # cli tools
    xdragon
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

    # vpn
    protonvpn-cli_2
    protonvpn-gui

    # for secrets
    sops

    # dev stuff
    gnumake
    python312
    jdk
    clang
    # git-credential-oauth
    gh
    jetbrains.idea-community
    # android-studio
    matlab

    # game dev
    libunity
    unityhub

    # gui apps
    kitty
    mediawriter
    gparted
    firefox
    nautilus
    nautilus-open-any-terminal # for nautilus
    zoom-us # unfree
    discord # unfree
    webcord # for discord screen sharing
    libreoffice-qt
    hunspell # for spellcheck
    vscode
    evince # gnome document viewer
    eog # gnome image viwer

    # Desktop experience stuff
    hyprpanel
    swww
    # waybar
    hyprcursor

    # Essential tools for wm
    wl-clipboard
    grim
    slurp
    hyprshot
    networkmanagerapplet
    polkit_gnome
    brightnessctl
    alsa-utils
    pavucontrol

    # battery stuff
    batsignal
    acpi

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

  home.sessionVariables = {EDITOR = "nvim"; NIXPKGS_ALLOW_UNFREE=1;};

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["zoom" "discord" "vscode" "steam-run" "steam-original" "android-studio-stable"];
}
