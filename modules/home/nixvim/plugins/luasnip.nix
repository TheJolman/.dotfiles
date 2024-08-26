{pkgs, ...}: {
  programs.nixvim.plugins.luasnip = {
    enable = true;
    settings = {enable_autosnippets = true;};
  };

  programs.nixvim.extraPackages = [pkgs.lua51Packages.jsregexp];
}
