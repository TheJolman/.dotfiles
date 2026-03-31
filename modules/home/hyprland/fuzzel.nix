{pkgs, ...}: {
  home.packages = [pkgs.bemoji];
  programs.fuzzel.enable = true;
}
