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
    aseprite
    tiled
    mozillavpn
    kitty
    impression # creates bootable drives
    gparted
    nautilus
    nautilus-open-any-terminal
    zoom-us # unfree
    vesktop
    libreoffice-fresh
    hunspell # for spellcheck
    hunspellDicts.en_US
    papers # gnome document viewer
    eog # gnome image viwer
    firefox
    agenix.packages.${system}.default
    gnome-font-viewer
    thunderbird-latest
    gnome-system-monitor
    transmission_4-gtk # torrent client
    celluloid # video player (showtime is another gnome option)
    kdePackages.kdenlive
    gnome-calculator
    obs-studio
    atlauncher # minecraft
    seahorse # for GnomeKeyring
    rnote
    filezilla
    warpinator
    newsflash # rss reader

    # ---- Fonts ---- #
    noto-fonts
    corefonts
    roboto
    fira
    overpass
    jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.fira-code
    nerd-fonts.zed-mono
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
    PNPM_HOME = "$HOME/.pnpm";
  };

  home.sessionPath = [
    "$HOME/.deno/bin"
    "$HOME/.pnpm"
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
  ];
}
