{
  pkgs,
  system,
  terminder,
  agenix,
  tetrigo,
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
    alejandra
    ripgrep
    xh
    jq
    traceroute
    terminder.packages.${system}.default
    lsof
    nfs-utils
    lftp
    killall
    dmidecode
    powertop
    tetrigo.packages.${system}.default
    tt # typing test

    # ---- Dev Tools ---- #
    deno
    nodejs
    pnpm
    gh-dash
    awscli2
    terraform
    stylua
    uv
    pixi
    pre-commit
    lazygit
    stable.unityhub
    stable.jetbrains.idea-ultimate
    stable.jetbrains.rider

    # ---- Networking ---- #
    dhcpm
    nmap
    arp-scan
    netdiscover
    nload
    iftop
    dnslookup

    # ---- GUI Apps ---- #
    gimp
    libresprite
    tiled
    mozillavpn
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
    agenix.packages.${system}.default
    gnome-font-viewer
    thunderbird-latest
    gnome-system-monitor
    transmission_4-gtk # torrent client
    celluloid # video player
    kdePackages.kdenlive
    gnome-network-displays # for miracast
    gnome-calculator
    kooha # screen recorder
    obs-studio
    atlauncher # minecraft
    seahorse # for GnomeKeyring
    rnote
    filezilla
    neovide
    warpinator

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
    PAGER = "bat";
    MANPAGER = "nvim +Man!";
    NIXPKGS_ALLOW_UNFREE = 1;
  };
}
