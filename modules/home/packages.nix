{
  pkgs,
  lib,
  inputs,
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
    gh
    uv

    # ---- Gui Apps ---- #
    wireshark
    matlab
    stable.unityhub
    jetbrains.idea-ultimate
    protonvpn-gui
    kitty
    impression
    gparted
    nautilus
    nautilus-open-any-terminal
    zoom-us # unfree
    vesktop
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
    celluloid
    kdenlive
    freetube
    gnome-network-displays # for miracast
    kooha
    prismlauncher

    # Fonts
    noto-fonts
    corefonts
    roboto

    nerd-fonts.caskaydia-cove
    nerd-fonts.fira-code
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fantasque-sans-mono
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "zoom"
      "discord"
      "vscode"
      "steam-run"
      "steam-original"
      "android-studio-stable"
    ];
}
