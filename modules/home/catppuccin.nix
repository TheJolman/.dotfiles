{inputs, ...}: {
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    cursors.enable = false;
    gtk.icon.enable = false;
    kvantum.enable = false;
    foot.enable = false;
    zellij.enable = false;
  };
}
