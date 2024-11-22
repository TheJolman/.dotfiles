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
    stable.unityhub
    dotnet-sdk
    python313

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
    firefox
    # inputs.zen-browser.packages.${pkgs.system}.default
    gnome-font-viewer
    thunderbird
    spotify
    gnome-system-monitor
    transmission_4-qt # torrent client
    vlc
    freetube
    gnome-network-displays # for miracast
    kooha

    # fonts
    noto-fonts
    corefonts
    roboto

    (pkgs.nerdfonts.override {
      fonts = ["FiraCode" "DejaVuSansMono" "FantasqueSansMono" "CascadiaCode"];
    })
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "kitty";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) ["zoom" "discord" "vscode" "steam-run" "steam-original" "android-studio-stable"];
}
