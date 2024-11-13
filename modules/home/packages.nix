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
    fd
    fastfetch
    lsd
    xorg.xhost
    parted
    polkit
    bat
    zip
    unzip
    nix-output-monitor
    nvd
    zoxide

    # vpn
    protonvpn-cli_2

    # for secrets
    sops

    # ---- Dev ---- #

    gh

    matlab

    unityhub
    dotnet-sdk

    # ---- Gui Apps ---- #

    # protonvpn-gui
    kitty
    impression
    gparted
    # firefox
    nautilus
    nautilus-open-any-terminal
    zoom-us # unfree
    # vesktop
    discord
    libreoffice-fresh
    hunspell # for spellcheck
    hunspellDicts.en_US
    evince # gnome document viewer
    eog # gnome image viwer
    inputs.zen-browser.packages.${pkgs.system}.default
    gnome-boxes
    gnome-font-viewer
    # thunderbird # can't get to work with my gmail atm
    spotify
    gnome-system-monitor
    transmission_4-qt # torrent client
    vlc
    freetube

    # fonts
    noto-fonts
    corefonts
    roboto

    (pkgs.nerdfonts.override {
      fonts = ["FiraCode" "DejaVuSansMono" "FantasqueSansMono" "CascadiaCode"];
    })

    # # You can also create simple shell scripts directly inside your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["zoom" "discord" "vscode" "steam-run" "steam-original" "android-studio-stable"];
}
