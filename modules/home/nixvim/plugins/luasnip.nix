{pkgs, ...}: {
  programs.nixvim.plugins.luasnip = {
    enable = true;
    extraConfig = {enable_autosnippets = true;};
  };

  programs.nixvim.extraPackages = [pkgs.lua51Packages.jsregexp];
}
