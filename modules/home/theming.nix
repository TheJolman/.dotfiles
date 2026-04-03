{pkgs, ...}: {
  imports = [
    ./catppuccin.nix
  ];

  home.packages = with pkgs; [
    gnome-themes-extra
  ];

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
    theme.name = "Adwaita-dark";
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
