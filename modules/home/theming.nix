{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
    # inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = false;
    gtk = {
      icon.enable = true;
      tweaks = ["normal"];
      flavor = "mocha";
    };
  };

  xdg.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  gtk = {
    enable = true;
    catppuccin = {
      # flavor = "mocha";
      # tweaks = ["normal"];
      # icon.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
  ];

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".source = pkgs.writeText "kvantum.kvconfig" ''
      [General]
      theme=catppuccin-frappe-yellow
    '';

    "Kvantum/catppuccin-frappe-yellow".source = "${pkgs.catppuccin-kvantum.override {
      variant = "frappe";
      accent = "yellow";
    }}/share/Kvantum/catppuccin-frappe-yellow";
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
