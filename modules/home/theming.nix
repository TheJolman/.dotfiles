{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
    # inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = false;
    gtk.enable = false; # depreciated
    gtk.icon.enable = true;
    kvantum.enable = true;
  };

  xdg.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  gtk = {
    enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
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
