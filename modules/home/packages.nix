{
  pkgs,
  lib,
  inputs,
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

    # ---- Dev ---- #

    gh
    # for c/cpp
    gnumake
    cmake

    # for python

    # for java and cs
    jdk
    jetbrains.rider
    dotnet-sdk

    # misc
    matlab
    unityhub

    # ---- End Dev ---- # 

    # gui apps
    kitty
    mediawriter
    gparted
    firefox
    nautilus
    nautilus-open-any-terminal # for nautilus
    zoom-us # unfree
    vesktop
    libreoffice-qt
    hunspell # for spellcheck
    vscode
    evince # gnome document viewer
    eog # gnome image viwer
    inputs.zen-browser.packages.${pkgs.system}.default
    gnome-boxes
    gnome-font-viewer
    
    spotify

    # Desktop experience stuff
    # hyprpanel
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
    batsignal # I think this needs to configured or something
    acpi

    # fonts
    noto-fonts
    corefonts
    roboto

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
