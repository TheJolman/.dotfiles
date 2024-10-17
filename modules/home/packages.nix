{
  pkgs,
  lib,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # ---- CLI Tools ---- #
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

    # for secrets
    sops

    # ---- Dev ---- #

    # tools
    gh

    # editors and ides
    jetbrains.rider
    vscode
    matlab
    unityhub

    # ---- Gui Apps ---- # 

    # protonvpn-gui
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
    evince # gnome document viewer
    eog # gnome image viwer
    # inputs.zen-browser.packages.${pkgs.system}.default
    gnome-boxes
    gnome-font-viewer
    # thunderbird # can't get to work with my gmail atm
    spotify
    gnome-system-monitor

    # ---- WM stuff ---- # 

    # hyprpanel
    # swww
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
    batsignal # I think this needs to set up or something
    acpi

    # fonts
    noto-fonts
    corefonts
    roboto

    (pkgs.nerdfonts.override {
      fonts = ["FiraCode" "DejaVuSansMono" "FantasqueSansMono"];
    })

    # # You can also create simple shell scripts directly inside your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {EDITOR = "nvim"; NIXPKGS_ALLOW_UNFREE=1;};

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["zoom" "discord" "vscode" "steam-run" "steam-original" "android-studio-stable"];
}
