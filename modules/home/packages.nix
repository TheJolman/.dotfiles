{
  pkgs,
  system,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # ---- CLI Apps ---- #
    dragon-drop
    file
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
    inputs.terminder.packages.${system}.default
    lsof
    nfs-utils
    lftp
    killall
    dmidecode
    powertop
    inputs.tetrigo.packages.${system}.default
    tt # typing test
    mcrcon # minecraft
    usbutils
    wirelesstools

    # ---- Dev Tools ---- #
    awscli2
    terraform
    stylua
    pixi
    pre-commit
    lazygit
    stable.unityhub
    stable.jetbrains.idea
    stable.jetbrains.rider
    bruno
    bruno-cli

    # ---- Networking ---- #
    dhcpm
    nmap
    arp-scan
    netdiscover
    nload
    iftop
    dnslookup

    # ---- GUI Apps ---- #
    file-roller # archive manager
    gimp
    # aseprite
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
    chromium
    # inputs.agenix.packages.${system}.default
    gnome-font-viewer
    thunderbird-latest
    gnome-system-monitor
    (transmission_4.override
      {
        enableGTK3 = true;
      }) # torrent client
    celluloid # video player (showtime is another gnome option)
    kdePackages.kdenlive
    gnome-calculator
    obs-studio
    atlauncher # minecraft
    seahorse # for GnomeKeyring
    rnote
    # filezilla
    newsflash # rss reader
    obsidian
    baobab # gnome dsik use analyzer

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
    "$HOME/.pnpm"
    "$HOME/go/bin"
    "$HOME/.cargo/bin"
  ];

  xdg.configFile."mimeapps.list" = {
    enable = true;
    text = ''
      [Default Applications]
      # Web & HTML
      application/pdf=firefox.desktop;
      text/html=firefox.desktop;
      application/xhtml+xml=firefox.desktop;
      x-scheme-handler/http=firefox.desktop;
      x-scheme-handler/https=firefox.desktop;
      x-scheme-handler/about=firefox.desktop;
      x-scheme-handler/unknown=firefox.desktop;
      x-scheme-handler/discord=vesktop.desktop;

      # Images
      image/jpeg=org.gnome.eog.desktop;
      image/png=org.gnome.eog.desktop;
      image/gif=org.gnome.eog.desktop;
      image/webp=org.gnome.eog.desktop;
      image/svg+xml=org.gnome.eog.desktop;
      image/bmp=org.gnome.eog.desktop;
      image/tiff=org.gnome.eog.desktop;

      # Documents
      application/vnd.oasis.opendocument.text=libreoffice-writer.desktop;
      application/vnd.oasis.opendocument.spreadsheet=libreoffice-calc.desktop;
      application/vnd.oasis.opendocument.presentation=libreoffice-impress.desktop;
      application/msword=libreoffice-writer.desktop;
      application/vnd.openxmlformats-officedocument.wordprocessingml.document=libreoffice-writer.desktop;
      application/vnd.ms-excel=libreoffice-calc.desktop;
      application/vnd.openxmlformats-officedocument.spreadsheetml.sheet=libreoffice-calc.desktop;
      application/vnd.ms-powerpoint=libreoffice-impress.desktop;
      application/vnd.openxmlformats-officedocument.presentationml.presentation=libreoffice-impress.desktop;

      # Torrents
      application/x-bittorrent=transmission-gtk.desktop;
      x-scheme-handler/magnet=transmission-gtk.desktop;

      # Email
      x-scheme-handler/mailto=thunderbird.desktop;

      # File manager
      inode/directory=org.gnome.Nautilus.desktop;
    '';
    force = true;
  };
}
