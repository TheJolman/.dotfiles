{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = false;
    gtk.icon.enable = true;
    kvantum.enable = false;
    kitty.enable = false;
  };
}
