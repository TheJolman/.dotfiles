{
  pkgs,
  catppuccin,
  ...
}: {
  imports = [
    catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = false;
    gtk.icon.enable = true;
    kvantum.enable = false;
    kitty.enable = false;
  };

  xdg.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/default-applications" = {
        terminal = "kitty";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    # gtk3.extraConfig = {
    #   Settings = ''
    #     gtk-application-prefer-dark-theme=1
    #   '';
    # };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 25;
  };

  fonts.fontconfig.enable = true;
}
