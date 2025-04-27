{
  pkgs,
  lib,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    # ---- CLI Apps ---- #
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
    alejandra
    pre-commit
    ripgrep
    stylua
    protonvpn-cli_2
    uv
    pixi
    xh
    jq
    gh-dash
    awscli2
    terraform
    traceroute
    claude-code
    gpt-cli
    inputs.terminder.packages.${system}.default
    codex
    lsof
    nfs-utils

    # ---- Networking ---- #
    dhcpm
    nmap
    arp-scan
    netdiscover
    nload
    iftop

    # ---- Gui Apps ---- #
    gimp
    stable.unityhub
    libresprite
    tiled
    stable.jetbrains.idea-ultimate
    protonvpn-gui
    kitty
    impression
    gparted
    nautilus
    nautilus-open-any-terminal
    zoom-us # unfree
    # vesktop
    legcord
    libreoffice-fresh
    hunspell # for spellcheck
    hunspellDicts.en_US
    evince # gnome document viewer
    eog # gnome image viwer
    firefox
    inputs.agenix.packages.${system}.default
    gnome-font-viewer
    thunderbird-latest
    spotify
    gnome-system-monitor
    transmission_4-qt # torrent client
    celluloid # video player
    kdePackages.kdenlive
    gnome-network-displays # for miracast
    gnome-calculator
    kooha # screen recorder
    prismlauncher # minecraft
    seahorse # for GnomeKeyring
    rnote
    bruno

    # ---- Fonts ---- #
    noto-fonts
    corefonts
    roboto
    fira
    overpass
    jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.fira-code
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.iosevka
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    NIXPKGS_ALLOW_UNFREE = 1;
  };
}
