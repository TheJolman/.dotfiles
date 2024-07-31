{inputs, ...}: {
  
  imports = [
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    pointerCursor.enable = true;
  };

  xdg.enable = true;
  gtk = {
    enable = true;
    catppuccin = {
      flavor = "mocha";
      tweaks = ["normal"];
      icon.enable = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   x11.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibta-Modern-Classic";
  #   size = 25;
  # };

  fonts.fontconfig.enable = true;
}
